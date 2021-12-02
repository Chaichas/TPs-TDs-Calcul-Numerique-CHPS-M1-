//
2	// Copyright (C) INRIA Serge Steer <Serge.Steer@inria.fr>
3	//
4	// This file must be used under the terms of the CeCILL.
5	// This source file is licensed as described in the file COPYING, which
6	// you should have received as part of this distribution.  The terms
7	// are also available at
8	// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
9	//
10	function [A,rows,cols,entries,rep,field,symm,comments] = mmread(filename)
11	
12	    //      Reads the contents of the Matrix Market file ''filename''
13	    //      into the matrix ''A''.
14	
15	    [lhs, rhs] = argn()
16	    apifun_checkrhs ( "mmread" , rhs , 1 )
17	    apifun_checklhs ( "mmread" , lhs , 0:8 )
18	    //
19	    // Check types
20	    apifun_checktype ( "mmread" , filename ,  "filename" , 1 , "string" )
21	    //
22	    // Check size
23	    apifun_checkscalar ( "mmread" , filename , "filename" , 1 )
24	    //
25	    // Check content
26	    // Nothing to do.
27	    //
28	    // Proceed...
29	    mmfile = mopen(filename,"r");
30	    [rows, cols, entries, rep, field, symm,comments] = mminfo(mmfile)
31	    if rep=='coordinate' then //sparse matrix
32	        if field=="real" then // real valued entries:
33	            Lines = mgetl(mmfile, -1);
34	            T = msscanf(-1, Lines,"%d %d %f");
35	            if size(T(:,1),1)<>entries then
36	                error("Not enough data in file");
37	            end;
38	            A = sparse(T(:,1:2),  T(:,3), [rows ,cols]);
39	        elseif field=="complex" then // complex valued entries:
40	            Lines = mgetl(mmfile, -1);
41	            T = msscanf(-1, Lines,"%d %d %f %f");
42	            if size(T(:,1),1)<>entries then
43	                error("Not enough data in file");
44	            end;
45	            A = sparse(T(:,1:2),  T(:,3)+%i*T(:,4), [rows ,cols]);
46	        elseif field=="pattern" then // pattern matrix (no values given):
47	            Lines = mgetl(mmfile, -1);
48	            T = msscanf(-1, Lines,"%d %d");
49	            if size(T(:,1),1)<>entries then
50	                error("Not enough data in file");
51	            end;
52	            A = sparse(T(:,1:2),  ones(entries,1), [rows ,cols]);
53	        end
54	    elseif rep=="array" then //   dense  array (column major) format
55	        if field=="real" then // real valued entries:
56	            Lines = mgetl(mmfile, -1);
57	            A = msscanf(-1, Lines,"%f");
58	            if or(symm==['symmetric','hermitian','skew-symmetric']) then
59	                for j=1:cols-1,
60	                    currenti = j*rows;
61	                    A = [A(1:currenti); zeros(j,1);A(currenti+1:length(A))];
62	                end
63	            elseif symm<>"general" then
64	                error("Unrecognized symmetry:"+symm+..
65	                "Recognized choices: symmetric,hermitian,skew-symmetric,general")
66	            end;
67	            A = matrix(A,rows,cols);
68	        elseif field=="complex" then // complx valued entries:
69	            Lines = mgetl(mmfile, -1);
70	            A = msscanf(-1, Lines,"%f %f");
71	            A=A(:,1)+%i*A(:,2)
72	            if or(symm==['symmetric','hermitian','skew-symmetric']) then
73	                for j=1:cols-1,
74	                    currenti = j*rows;
75	                    A = [A(1:currenti); zeros(j,1);A(currenti+1:length(A))];
76	                end
77	            elseif symm<>"general" then
78	                error("Unrecognized symmetry:"+symm+..
79	                "Recognized choices: symmetric,hermitian,skew-symmetric,general")
80	            end;
81	            A = matrix(A,rows,cols);
82	        end;
83	    elseif field=="pattern" then // pattern (makes no sense for dense)
84	        error("Pattern matrix type invalid for array storage format.");
85	    else // Unknown matrix type
86	        error("Invalid matrix type specification. Check header against MM documentation.");
87	    end;
88	
89	    //
90	    // If symmetric, skew-symmetric or Hermitian, duplicate lower
91	    // triangular part and modify entries as appropriate:
92	    //
93	    if symm=="symmetric" then
94	        A = A + A.' - diag(diag(A));
95	        entries = nnz(A);
96	    elseif symm=="hermitian" then
97	        A = A + A' - diag(diag(A));
98	        entries = nnz(A);
99	    elseif symm=="skew-symmetric" then
100	        A = A - tril(A,-1).';
101	        entries = nnz(A);
102	    end;
103	
104	    mclose(mmfile);
105	    // Done.
106	endfunction␊

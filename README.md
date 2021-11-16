The triangle program benchmark

Use with minimal 14 tests covering all the code in

Fitness Landscape of the Triangle Program,
William B. Langdon and Mark Harman 
presented at the PPSN-2016 Workshop on Landscape-Aware Heuristic Search,
Nadarajen Veerapen and Gabriela Ochoa (editors), 17-21 September
http://www.cs.ucl.ac.uk/fileadmin/UCL-CS/research/Research_Notes/rn1605.pdf

Data set http://www.cs.ucl.ac.uk/staff/W.Langdon/ppsn2016/triangle/


Visualising the Search Landscape of the Triangle Program,
William B. Langdon and Nadarajen Veerapen and Gabriela Ochoa, in
EuroGP-2017, M. Castelli and J. McDermott and L. Sekanina, Eds.,
LNCS 10196, Amsterdam, 19-21 April, Springer. 
http://dx.doi.org/10.1007/978-3-319-55696-3_7
https://dspace.stir.ac.uk/bitstream/1893/24848/1/triangle.pdf

Data set http://www.cs.ucl.ac.uk/staff/W.Langdon/egp2017/triangle/

Original code distribution http://www.cs.ucl.ac.uk/staff/W.Langdon/ftp/gp-code/triangle.tar.gz

<p>
<hr>
<P>
<UL>
<li><a href="information.awk">information.awk</a>
gawk script to process huge volume of data generated by main2.c
and calculate mutual information between each input and
<UL>
<li>the Triangle Program output
<li>the internal triang variable at various lines inside the program
after triang is (conditionally) updated.
</UL>
<pre>
./a.out | gawk -f information.awk > information.dat
</pre>(takes 4.4GB and a several minutes)

<li>information.dat
<br>
Output of information.awk (not in github)

<li><a href="information_filter.awk">information_filter.awk</a>
<br>preprocess output of main2.c for information.gnu
<pre>
./a.out | gawk -f information_filter.awk > information_filter.out
</pre>

<li>information_filter.out
<br>
Output of information_filter.awk (not in github) for use by information.gnu

<li><a href="information.gnu">information.gnu</a>
<br>gnuplot script to show distribution of values held by
the internal triang variable at various lines inside the program
after each time it is conditionally updated.
Note lines are horizontal. 
This shows that not only is
the distribution the same for each of the three inputs
but also there is
no variation with input value.

<li>information.out
<br>
More recent version of output of information_filter.awk 
(again not in github) for use by information_return.gnu

<li><a href="information_return.gnu">information_return.gnu</a>
<br>like information.gnu
a gnuplot script to show distribution of values output by
the Triangle Program.
Again the distribution for each of the three inputs are
identical.
Note almost all return values are 4 (not a triangle)
and the other three values only occur if the input is positive.


<li><a href="isosceles.gnu">isosceles.gnu</a>
<br>Example gnuplot script to show 3D plot of three planes in 3D input space of
the Triangle Program corresponding to outputs
2 isosceles and 3 Equilateral
on the user's screen.
User interaction via mouse etc.
(Other values not plotted).
Assumes 8120601 test cases for the Triangle Program.

<li><a href="main2.c">main2.c</a>
<br>C file for instrumented version the Triangle Program
Generates 8120601 test outputs using triang.c

<li><a href="main.c">main.c</a>

<li><a href="README.md">README.md</a>
<br>This file

<li><a href="triang.c">triang.c</a>
<br>Instrumented version the Triangle Program and support routines for main2.c

<li><a href="triangle.c">triangle.c</a>
<br>Original C source the Triangle Program

<li><a href="triangle.gnu">triangle.gnu</a>

<li><a href="triangle_h.awk">triangle_h.awk</a>
<br>Example of calculating Entropy.
Assumes 8120601 test cases for the Triangle Program
<pre>
gawk -f triangle_h.awk /dev/null
Equilateral     3     100 0.000012 0.000200839
Isosceles       2   22200 0.002734 0.0232779
not_a_triangle  4 7605851 0.936612 0.0884881
Scalene         1  492450 0.060642 0.245208

entropy in 22.9532     entropy out 0.357175</pre>

<li><a href="triangle.scalene">triangle.scalene</a>

<li><a href="triang.out">triang.out</a>
</ul>

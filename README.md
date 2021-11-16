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
<li><a href="information.dat">information.dat</a>
<li><a href="information_filter.awk">information_filter.awk</a>
<li><a href="information_filter.out">information_filter.out</a>
<li><a href="information.gnu">information.gnu</a>
<li><a href="information.out">information.out</a>
<li><a href="information_return.gnu">information_return.gnu</a>
<li><a href="isosceles.gnu">isosceles.gnu</a>
<br>Example gnuplot script to show 3D plot of three planes in 3D input space of
the Triangle Program correspoding to outputs
2 isosceles and 3&nbsp;Equilateral
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

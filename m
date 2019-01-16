Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=gPJMqQknQ/ZQSR4BppSy1PgRUi4XKxb8s4/Te4SlPBs=;
        b=eFTGRYXnpLGv75YaPEpWprQ5vkLRnYFBDRC49RryzUpBLZUDSHbYDJYiDDFAUTmhKR
         POzWMtY/5F/MOTou7zmv3IbxnvrZeDz+MRTmFnJURpsz5uwZn9Yn1C0H3AE4d4+v3BZq
         m6yKvaUZkHySBl03fVK1RY4b/rjs3/4qiLD7i5SbMwl0kGDsZUoFt0Uip39Q3eUr+Bci
         FIKpffoY2fnOj3ybqZ8OqEQ/Tl7fwwBnbUBvZ9acX9iEjmxgZ8R0VEAdOJYjcS57C1Sx
         vfeVdYaQ75RS73LBVUm3x872fslaWXHEw2hsmKV5CVzgvZIcYnhIJU+yDGeIanXKsIkF
         P4RQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] debugging: Employ new scheme for code snippets
Message-ID: <8f5851dd-d9e0-2caa-2c24-9c64a9b33636@gmail.com>
Date: Wed, 16 Jan 2019 23:43:12 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 87259dba261e59aba91f5e9b7943274567b200dd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 16 Jan 2019 23:03:58 +0900
Subject: [PATCH] debugging: Employ new scheme for code snippets

In sh/awk code, it is not possible to put inline comments on
lines ending with "\". To avoid continuations, shorten variable
names in datablows.sh.

As source files of snippets are searched under CodeSamples/,
put a symbolic link to utilities/datablows.sh under
CodeSamples/debugging.

"grep -r" doesn't follow symbolic links, so use the "-R" option
instead.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Another snippet scheme update.

I'm wondering if you are OK with the shortening of variable names
in datablows.sh.  It looks like almost impossible to properly put
a label as a comment to the line of the form:

    awk -v divisor=$divisor -v relerr=$relerr \  <-- this line
        -v trendbreak=$trendbreak '{

, while keeping the script executable.

Thoughts?

        Thanks, Akira
--
 CodeSamples/debugging/datablows.sh |   1 +
 Makefile                           |   4 +-
 debugging/debugging.tex            | 196 +++++++++++++------------------------
 utilities/datablows.sh             |  60 ++++++------
 utilities/gen_snippet_d.pl         |   4 +-
 5 files changed, 105 insertions(+), 160 deletions(-)
 create mode 120000 CodeSamples/debugging/datablows.sh

diff --git a/CodeSamples/debugging/datablows.sh b/CodeSamples/debugging/datablows.sh
new file mode 120000
index 0000000..cd04dd2
--- /dev/null
+++ b/CodeSamples/debugging/datablows.sh
@@ -0,0 +1 @@
+../../utilities/datablows.sh
\ No newline at end of file
diff --git a/Makefile b/Makefile
index b76eea0..6ef4629 100644
--- a/Makefile
+++ b/Makefile
@@ -83,8 +83,8 @@ A2PING_GSCNFL := 0
 endif
 endif
 
-SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
-SOURCES_OF_LITMUS      := $(shell grep -r -l -F '\begin[snippet]' CodeSamples)
+SOURCES_OF_SNIPPET_ALL := $(shell grep -R -l -F '\begin{snippet}' CodeSamples)
+SOURCES_OF_LITMUS      := $(shell grep -R -l -F '\begin[snippet]' CodeSamples)
 SOURCES_OF_LTMS        := $(patsubst %.litmus,%.ltms,$(SOURCES_OF_LITMUS))
 SOURCES_OF_SNIPPET     := $(filter-out $(SOURCES_OF_LTMS),$(SOURCES_OF_SNIPPET_ALL)) $(SOURCES_OF_LITMUS)
 GEN_SNIPPET_D  = utilities/gen_snippet_d.pl utilities/gen_snippet_d.sh
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 37d9022..0d5023f 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -217,17 +217,11 @@ validation is just the right type of job for you.
 	Suppose that you are writing a script that processes the
 	output of the \co{time} command, which looks as follows:
 
-	\vspace{5pt}
-	\begin{minipage}[t]{\columnwidth}
-	\tt
-	\scriptsize
-	\begin{verbatim}
+	\begin{VerbatimU}
 		real    0m0.132s
 		user    0m0.040s
 		sys     0m0.008s
-	\end{verbatim}
-	\end{minipage}
-	\vspace{5pt}
+	\end{VerbatimU}
 
 	The script is required to check its input for errors, and to
 	give appropriate diagnostics if fed erroneous \co{time} output.
@@ -585,16 +579,10 @@ In some such cases, assertions can be helpful.
 
 Assertions are usually implemented in the following manner:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\tt
-\scriptsize
-\begin{verbatim}
-  1 if (something_bad_is_happening())
-  2   complain();
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+if (something_bad_is_happening())
+	complain();
+\end{VerbatimN}
 
 This pattern is often encapsulated into C-preprocessor macros or
 language intrinsics, for example, in the Linux kernel, this might
@@ -2124,41 +2112,39 @@ Similarly, interrupt-based interference can be detected via the
 \path{/proc/interrupts} file.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 #include <sys/time.h>
-  2 #include <sys/resource.h>
-  3 
-  4 /* Return 0 if test results should be rejected. */
-  5 int runtest(void)
-  6 {
-  7   struct rusage ru1;
-  8   struct rusage ru2;
-  9 
- 10   if (getrusage(RUSAGE_SELF, &ru1) != 0) {
- 11     perror("getrusage");
- 12     abort();
- 13   }
- 14   /* run test here. */
- 15   if (getrusage(RUSAGE_SELF, &ru2 != 0) {
- 16     perror("getrusage");
- 17     abort();
- 18   }
- 19   return (ru1.ru_nvcsw == ru2.ru_nvcsw &&
- 20     ru1.runivcsw == ru2.runivcsw);
- 21 }
-\end{verbbox}
+\begin{linelabel}[ln:debugging:Using getrusage() to Detect Context Switches]
+\begin{VerbatimL}
+#include <sys/time.h>
+#include <sys/resource.h>
+
+/* Return 0 if test results should be rejected. */
+int runtest(void)
+{
+	struct rusage ru1;
+	struct rusage ru2;
+
+	if (getrusage(RUSAGE_SELF, &ru1) != 0) {
+		perror("getrusage");
+		abort();
+	}
+	/* run test here. */
+	if (getrusage(RUSAGE_SELF, &ru2 != 0) {
+		perror("getrusage");
+		abort();
+	}
+	return (ru1.ru_nvcsw == ru2.ru_nvcsw &&
+	        ru1.runivcsw == ru2.runivcsw);
 }
-\centering
-\theverbbox
+\end{VerbatimL}
+\end{linelabel}
 \caption{Using \tco{getrusage()} to Detect Context Switches}
-\label{lst:count:Using getrusage() to Detect Context Switches}
+\label{lst:debugging:Using getrusage() to Detect Context Switches}
 \end{listing}
 
 Opening and reading files is not the way to low overhead, and it is
 possible to get the count of context switches for a given thread
 by using the \co{getrusage()} system call, as shown in
-Listing~\ref{lst:count:Using getrusage() to Detect Context Switches}.
+Listing~\ref{lst:debugging:Using getrusage() to Detect Context Switches}.
 This same system call can be used to detect minor page faults (\co{ru_minflt})
 and major page faults (\co{ru_majflt}).
 
@@ -2207,70 +2193,12 @@ thus far, then the next element is accepted and the process repeats.
 Otherwise, the remainder of the list is rejected.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 divisor=3
-  2 relerr=0.01
-  3 trendbreak=10
-  4 while test $# -gt 0
-  5 do
-  6   case "$1" in
-  7   --divisor)
-  8     shift
-  9     divisor=$1
- 10     ;;
- 11   --relerr)
- 12     shift
- 13     relerr=$1
- 14     ;;
- 15   --trendbreak)
- 16     shift
- 17     trendbreak=$1
- 18     ;;
- 19   esac
- 20   shift
- 21 done
- 22 
- 23 awk -v divisor=$divisor -v relerr=$relerr \
- 24     -v trendbreak=$trendbreak '{
- 25   for (i = 2; i <= NF; i++)
- 26     d[i - 1] = $i;
- 27   asort(d);
- 28   i = int((NF + divisor - 1) / divisor);
- 29   delta = d[i] - d[1];
- 30   maxdelta = delta * divisor;
- 31   maxdelta1 = delta + d[i] * relerr;
- 32   if (maxdelta1 > maxdelta)
- 33     maxdelta = maxdelta1;
- 34   for (j = i + 1; j < NF; j++) {
- 35     if (j <= 2)
- 36       maxdiff = d[NF - 1] - d[1];
- 37     else
- 38       maxdiff = trendbreak * \
- 39       (d[j - 1] - d[1]) / (j - 2);
- 40     if (d[j] - d[1] > maxdelta && \
- 41         d[j] - d[j - 1] > maxdiff)
- 42       break;
- 43   }
- 44   n = sum = 0;
- 45   for (k = 1; k < j; k++) {
- 46     sum += d[k];
- 47     n++;
- 48   }
- 49   min = d[1];
- 50   max = d[j - 1];
- 51   avg = sum / n;
- 52   print $1, avg, min, max, n, NF - 1;
- 53 }'
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/debugging/datablows@whole.fcv}
 \caption{Statistical Elimination of Interference}
-\label{lst:count:Statistical Elimination of Interference}
+\label{lst:debugging:Statistical Elimination of Interference}
 \end{listing}
 
-Listing~\ref{lst:count:Statistical Elimination of Interference}
+Listing~\ref{lst:debugging:Statistical Elimination of Interference}
 shows a simple \co{sh}/\co{awk} script implementing this notion.
 Input consists of an x-value followed by an arbitrarily long list of y-values,
 and output consists of one line for each input line, with fields as follows:
@@ -2305,44 +2233,58 @@ This script takes three optional arguments as follows:
 	which case the ``break'' will be ignored.)
 \end{description}
 
-Lines~1-3 of
-Listing~\ref{lst:count:Statistical Elimination of Interference}
-set the default values for the parameters, and lines~4-21 parse
+\begin{lineref}[ln:debugging:datablows:whole]
+Lines~\lnref{param:b}-\lnref{param:e} of
+Listing~\ref{lst:debugging:Statistical Elimination of Interference}
+set the default values for the parameters, and
+lines~\lnref{parse:b}-\lnref{parse:e} parse
 any command-line overriding of these parameters.
-The \co{awk} invocation on lines~23 and~24 sets the values of the
+\end{lineref}
+\begin{lineref}[ln:debugging:datablows:whole:awk]
+The \co{awk} invocation on line~\lnref{invoke} sets the values of the
 \co{divisor}, \co{relerr}, and \co{trendbreak} variables to their
 \co{sh} counterparts.
-In the usual \co{awk} manner, lines~25-52 are executed on each input
+In the usual \co{awk} manner,
+lines~\lnref{copy:b}-\lnref{end} are executed on each input
 line.
-The loop spanning lines~24 and~26 copies the input y-values to the
-\co{d} array, which line~27 sorts into increasing order.
-Line~28 computes the number of y-values that are to be trusted absolutely
+The loop spanning lines~\lnref{copy:b} and~\lnref{copy:e} copies
+the input y-values to the
+\co{d} array, which line~\lnref{asort} sorts into increasing order.
+Line~\lnref{comp_i} computes the number of y-values that are to be
+trusted absolutely
 by applying \co{divisor} and rounding up.
 
-Lines~29-33 compute the \co{maxdelta} value used as a lower bound on
+Lines~\lnref{delta}-\lnref{comp_max:e} compute the \co{maxdelta}
+value used as a lower bound on
 the upper bound of y-values.
-To this end, lines~29 and~30 multiply the difference in values over
+To this end, line~\lnref{maxdelta} multiplies the difference in values over
 the trusted region of data by the \co{divisor}, which projects the
 difference in values across the trusted region across the entire
 set of y-values.
 However, this value might well be much smaller than the relative error,
-so line~31 computes the absolute error (\co{d[i] * relerr}) and adds
+so line~\lnref{maxdelta1} computes the absolute error (\co{d[i] * relerr})
+and adds
 that to the difference \co{delta} across the trusted portion of the data.
-Lines~32 and~33 then compute the maximum of these two values.
+Lines~\lnref{comp_max:b} and~\lnref{comp_max:e} then compute the maximum of
+these two values.
 
-Each pass through the loop spanning lines~34-43 attempts to add another
+Each pass through the loop spanning lines~\lnref{add:b}-\lnref{add:e}
+attempts to add another
 data value to the set of good data.
-Lines~35-39 compute the trend-break delta, with line~36 disabling this
+Lines~\lnref{chk_engh}-\lnref{break} compute the trend-break delta,
+with line~\lnref{chk_engh} disabling this
 limit if we don't yet have enough values to compute a trend,
-and with lines~38 and~39 multiplying \co{trendbreak} by the average
+and with line~\lnref{mul_avr} multiplying \co{trendbreak} by the average
 difference between pairs of data values in the good set.
-If line~40 determines that the candidate data value would exceed the
+If line~\lnref{chk_max} determines that the candidate data value would exceed the
 lower bound on the upper bound (\co{maxdelta}) \emph{and}
-line~41 determines that the difference between the candidate data value
+that the difference between the candidate data value
 and its predecessor exceeds the trend-break difference (\co{maxdiff}),
-then line~42 exits the loop: We have the full good set of data.
+then line~\lnref{break} exits the loop: We have the full good set of data.
 
-Lines~44-52 then compute and print the statistics for the data set.
+Lines~\lnref{comp_stat:b}-\lnref{comp_stat:e} then compute and print
+the statistics for the data set.
+\end{lineref}
 
 \QuickQuiz{}
 	This approach is just plain weird!
@@ -2368,7 +2310,7 @@ Lines~44-52 then compute and print the statistics for the data set.
 
 	Of course, it is possible to create a script similar to
 	that in
-	Listing~\ref{lst:count:Statistical Elimination of Interference}
+	Listing~\ref{lst:debugging:Statistical Elimination of Interference}
 	that uses standard deviation rather than absolute difference
 	to get a similar effect,
 	and this is left as an exercise for the interested reader.
diff --git a/utilities/datablows.sh b/utilities/datablows.sh
index 83d86d7..c4060c2 100644
--- a/utilities/datablows.sh
+++ b/utilities/datablows.sh
@@ -34,49 +34,50 @@
 #
 # Authors: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
 
-divisor=3
-relerr=0.01
-trendbreak=10
-while test $# -gt 0
+#\begin{snippet}[labelbase=ln:debugging:datablows:whole,commandchars=\!\@\%]
+div=3				#\lnlbl{param:b}
+rel=0.01
+tre=10				#\lnlbl{param:e}
+while test $# -gt 0		#\lnlbl{parse:b}
 do
 	case "$1" in
 	--divisor)
 		shift
-		divisor=$1
+		div=$1
 		;;
 	--relerr)
 		shift
-		relerr=$1
+		rel=$1
 		;;
 	--trendbreak)
 		shift
-		trendbreak=$1
+		tre=$1
 		;;
 	esac
 	shift
-done
-# echo divisor: $divisor relerr: $relerr trendbreak: $trendbreak
+done				#\lnlbl{parse:e}
+# echo divisor: $div relerr: $rel trendbreak: $tre #\fcvexclude
 
-awk -v divisor=$divisor -v relerr=$relerr -v trendbreak=$trendbreak '{
-	for (i = 2; i <= NF; i++)
-		d[i - 1] = $i;
-	asort(d);
-	i = int((NF + divisor - 1) / divisor);
-	delta = d[i] - d[1];
-	maxdelta = delta * divisor;
-	maxdelta1 = delta + d[i] * relerr;
-	if (maxdelta1 > maxdelta)
-		maxdelta = maxdelta1;
-	for (j = i + 1; j < NF; j++) {
-		if (j <= 2)
+awk -v divisor=$div -v relerr=$rel -v trendbreak=$tre '{#\lnlbl{awk:invoke}
+	for (i = 2; i <= NF; i++)		#\lnlbl{awk:copy:b}
+		d[i - 1] = $i;			#\lnlbl{awk:copy:e}
+	asort(d);				#\lnlbl{awk:asort}
+	i = int((NF + divisor - 1) / divisor);	#\lnlbl{awk:comp_i}
+	delta = d[i] - d[1];			#\lnlbl{awk:delta}
+	maxdelta = delta * divisor;		#\lnlbl{awk:maxdelta}
+	maxdelta1 = delta + d[i] * relerr;	#\lnlbl{awk:maxdelta1}
+	if (maxdelta1 > maxdelta)		#\lnlbl{awk:comp_max:b}
+		maxdelta = maxdelta1;		#\lnlbl{awk:comp_max:e}
+	for (j = i + 1; j < NF; j++) {		#\lnlbl{awk:add:b}
+		if (j <= 2)			#\lnlbl{awk:chk_engh}
 			maxdiff = d[NF - 1] - d[1];
 		else
-			maxdiff = trendbreak * (d[j - 1] - d[1]) / (j - 2);
-# print "i: " i, "j: " j, "maxdelta: " maxdelta, "maxdiff: " maxdiff, "d[j] - d[j - 1]: " d[j] - d[j - 1]
-		if (d[j] - d[1] > maxdelta && d[j] - d[j - 1] > maxdiff)
-			break;
-	}
-	n = sum = 0;
+			maxdiff = trendbreak * (d[j - 1] - d[1]) / (j - 2); #\lnlbl{awk:mul_avr}
+# print "i: " i, "j: " j, "maxdelta: " maxdelta, "maxdiff: " maxdiff, "d[j] - d[j - 1]: " d[j] - d[j - 1] #\fcvexclude
+		if (d[j] - d[1] > maxdelta && d[j] - d[j - 1] > maxdiff) #\lnlbl{awk:chk_max}
+			break;			#\lnlbl{awk:break}
+	}					#\lnlbl{awk:add:e}
+	n = sum = 0;				#\lnlbl{awk:comp_stat:b}
 	for (k = 1; k < j; k++) {
 		sum += d[k];
 		n++;
@@ -84,5 +85,6 @@ awk -v divisor=$divisor -v relerr=$relerr -v trendbreak=$trendbreak '{
 	min = d[1];
 	max = d[j - 1];
 	avg = sum / n;
-	print $1, avg, min, max, n, NF - 1;
-}'
+	print $1, avg, min, max, n, NF - 1;	#\lnlbl{awk:comp_stat:e}
+}'						#\lnlbl{awk:end}
+#\end{snippet}
diff --git a/utilities/gen_snippet_d.pl b/utilities/gen_snippet_d.pl
index e07e58d..580e5ca 100755
--- a/utilities/gen_snippet_d.pl
+++ b/utilities/gen_snippet_d.pl
@@ -23,9 +23,9 @@ my $re;
 $snippet_key = '\begin{snippet}' ;
 $snippet_key_ltms = '\begin[snippet]' ;
 @ignore_re = ('\.swp$', '~$', '\#$') ;  # to ignore backup of vim and emacs
-@fcvsources = `grep -l -r -F '$snippet_key' CodeSamples` ;
+@fcvsources = `grep -l -R -F '$snippet_key' CodeSamples` ;
 @fcvsources = grep { not /\.ltms$/ } @fcvsources ;
-@fcvsources_ltms = `grep -l -r -F '$snippet_key_ltms' CodeSamples` ;
+@fcvsources_ltms = `grep -l -R -F '$snippet_key_ltms' CodeSamples` ;
 foreach $re (@ignore_re) {
     @fcvsources = grep { not /$re/ } @fcvsources ;
     @fcvsources_ltms = grep { not /$re/ } @fcvsources_ltms ;
-- 
2.7.4


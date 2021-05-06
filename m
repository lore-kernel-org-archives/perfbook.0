Return-Path: <SRS0=jSvE=KB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qLcsLzQxIvYnaGI1ZhpJWjGORLHuLHAvMXXLIb9E0W8=;
        b=lcS6ZYMBGiRGBjpD9tO0jA3EUTtrtUx2OIEMpSaxrWza4L/6H08pD/4+9B7s7+ClCl
         ILfoA0/zFSA99LiLk67cgHBYxIt6EjMneGFK9URW9sQCIQ10zvpAZOPMSGwFrlyQiPU5
         ifmlkW3iOZD686p8KI2OTqN/AZ6JrDTlVsr4h5TGocSGHFmC1Gje17FQ1KihK/UFWsPt
         FgxabrxlABErIfASr6ubymcVzNnX6umhQ001k4+ZGQoDVytXxkKr7PKGRJUgq/WwYufg
         w6mxC8HxwZZaGcozru965fi0zJBe53RqFj5u+HmA/DHFjhS3owibaICtNPySWO/YF/u8
         EYaw==
Subject: [PATCH -perfbook 4/4] toolsoftrade: Employ \cref{} and its variants
References: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5b77654e-9637-32ce-9832-29ea6a162e08@gmail.com>
Date: Thu, 6 May 2021 23:27:14 +0900
MIME-Version: 1.0
In-Reply-To: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also define \clnrefr{} and \Clnrefr{} to be used instead of
"line~\ref{ln:xxx:yyy}", whose argument is a (list of) raw line label(s).

They can be used outside of "fcvref" environments.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex               |  21 ++
 toolsoftrade/toolsoftrade.tex | 412 +++++++++++++++++-----------------
 2 files changed, 226 insertions(+), 207 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 80d7fb0c..6e7d8d1f 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -341,8 +341,28 @@
   \docsvlist{#1}% Process list
   \fi%
 }
+\newcommand{\clnrefpraw}[2]{%
+  \setcounter{lblcount}{0}% Restart label count
+  \renewcommand*{\do}[1]{\stepcounter{lblcount}}% Count label
+  \docsvlist{#1}% Process list and count labels
+  \def\nextitem{\def\nextitem{, }}% Separator
+  \ifnum\value{lblcount}=1 #2~\lnrefraw{#1}%
+  \else\ifnum\value{lblcount}=2 {#2}s~%
+  \renewcommand*{\do}[1]{%
+    \addtocounter{lblcount}{-1}%
+    \ifnum\value{lblcount}=0 { }and~\else\nextitem\fi\lnrefraw{##1}}% How to process each label
+  \else {#2}s~%
+  \renewcommand*{\do}[1]{%
+    \addtocounter{lblcount}{-1}%
+    \ifnum\value{lblcount}=0 , and~\else\nextitem\fi\lnrefraw{##1}}% How to process each label
+  \fi%
+  \docsvlist{#1}% Process list
+  \fi%
+}
 \newcommand{\clnref}[1]{\clnrefp{#1}{line}}
 \newcommand{\Clnref}[1]{\clnrefp{#1}{Line}}
+\newcommand{\clnrefr}[1]{\clnrefpraw{#1}{line}}
+\newcommand{\Clnrefr}[1]{\clnrefpraw{#1}{Line}}
 \newcommand{\clnrefrange}[2]{lines~\lnref{#1}\==\lnref{#2}}
 \newcommand{\Clnrefrange}[2]{Lines~\lnref{#1}\==\lnref{#2}}
 \newcommand{\clnrefthro}[2]{lines~\lnref{#1} through~\lnref{#2}}
@@ -497,6 +517,7 @@
 }
 \newcommand{\lnrefbase}{}
 \newcommand{\lnref}[1]{\ref{\lnrefbase:#1}}
+\newcommand{\lnrefraw}[1]{\ref{#1}}
 
 \newenvironment{fcvlabel}[1][]{\renewcommand{\lnlblbase}{#1}%
 \ignorespaces}{\ignorespacesafterend}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index f9a8ee90..45d32c79 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -10,14 +10,14 @@
 This chapter provides a brief introduction to some basic tools of the
 parallel-programming trade, focusing mainly on those available to
 user applications running on operating systems similar to Linux.
-Section~\ref{sec:toolsoftrade:Scripting Languages} begins with
+\Cref{sec:toolsoftrade:Scripting Languages} begins with
 scripting languages,
-Section~\ref{sec:toolsoftrade:POSIX Multiprocessing}
+\cref{sec:toolsoftrade:POSIX Multiprocessing}
 describes the multi-process parallelism supported by the POSIX API and
 touches on POSIX threads,
-Section~\ref{sec:toolsoftrade:Alternatives to POSIX Operations}
+\cref{sec:toolsoftrade:Alternatives to POSIX Operations}
 presents analogous operations in other environments, and finally,
-Section~\ref{sec:toolsoftrade:The Right Tool for the Job: How to Choose?}
+\cref{sec:toolsoftrade:The Right Tool for the Job: How to Choose?}
 helps to choose the tool that will get the job done.
 
 \QuickQuiz{
@@ -59,16 +59,15 @@ This can be accomplished using UNIX shell scripting as follows:
 \end{figure}
 
 \begin{fcvref}[ln:toolsoftrade:parallel:compute_it]
-Lines~\lnref{comp1} and~\lnref{comp2} launch two instances of this
+\Clnref{comp1,comp2} launch two instances of this
 program, redirecting their
 output to two separate files, with the \co{&} character directing the
 shell to run the two instances of the program in the background.
-Line~\lnref{wait} waits for both instances to complete, and
-lines~\lnref{cat1} and~\lnref{cat2}
-display their output.
+\Clnref{wait} waits for both instances to complete, and
+\clnref{cat1,cat2} display their output.
 \end{fcvref}
 The resulting execution is as shown in
-Figure~\ref{fig:toolsoftrade:Execution Diagram for Parallel Shell Execution}:
+\cref{fig:toolsoftrade:Execution Diagram for Parallel Shell Execution}:
 the two instances of \co{compute_it} execute in parallel,
 \co{wait} completes after both of them do, and then the two instances
 of \co{cat} execute sequentially.
@@ -146,7 +145,7 @@ programming need not always be complex or difficult.
 	in a coarse-grained form.
 	If not, they should consider using other parallel-programming
 	environments, such as those discussed in
-	Section~\ref{sec:toolsoftrade:POSIX Multiprocessing}.
+	\cref{sec:toolsoftrade:POSIX Multiprocessing}.
 }\QuickQuizEnd
 
 \section{POSIX Multiprocessing}
@@ -157,13 +156,13 @@ programming need not always be complex or difficult.
 This section scratches the surface of the
 POSIX environment, including pthreads~\cite{OpenGroup1997pthreads},
 as this environment is readily available and widely implemented.
-Section~\ref{sec:toolsoftrade:POSIX Process Creation and Destruction}
+\Cref{sec:toolsoftrade:POSIX Process Creation and Destruction}
 provides a glimpse of the POSIX \co{fork()} and related primitives,
-Section~\ref{sec:toolsoftrade:POSIX Thread Creation and Destruction}
+\cref{sec:toolsoftrade:POSIX Thread Creation and Destruction}
 touches on thread creation and destruction,
-Section~\ref{sec:toolsoftrade:POSIX Locking} gives a brief overview
+\cref{sec:toolsoftrade:POSIX Locking} gives a brief overview
 of POSIX locking, and, finally,
-Section~\ref{sec:toolsoftrade:POSIX Reader-Writer Locking} describes a
+\cref{sec:toolsoftrade:POSIX Reader-Writer Locking} describes a
 specific lock which can be used for data that is read by many threads and only
 occasionally updated.
 
@@ -212,18 +211,18 @@ If \co{fork()} succeeds, it returns twice, once for the parent
 and again for the child.
 The value returned from \co{fork()} allows the caller to tell
 the difference, as shown in
-Listing~\ref{lst:toolsoftrade:Using the fork() Primitive}
+\cref{lst:toolsoftrade:Using the fork() Primitive}
 (\path{forkjoin.c}).
-Line~\lnref{fork} executes the \co{fork()} primitive, and saves
+\Clnref{fork} executes the \co{fork()} primitive, and saves
 its return value in local variable \co{pid}.
-Line~\lnref{if} checks to see if \co{pid} is zero, in which case,
-this is the child, which continues on to execute line~\lnref{child}.
+\Clnref{if} checks to see if \co{pid} is zero, in which case,
+this is the child, which continues on to execute \clnref{child}.
 As noted earlier, the child may terminate via the \co{exit()} primitive.
 Otherwise, this is the parent, which checks for an error return from
-the \co{fork()} primitive on line~\lnref{else}, and prints an error
+the \co{fork()} primitive on \clnref{else}, and prints an error
 and exits on \clnrefrange{errora}{errorb} if so.
 Otherwise, the \co{fork()} has executed successfully, and the parent
-therefore executes line~\lnref{parent} with the variable \co{pid}
+therefore executes \clnref{parent} with the variable \co{pid}
 containing the process ID of the child.
 \end{fcvref}
 
@@ -241,20 +240,20 @@ counterpart, as each invocation of \co{wait()} waits for but one child
 process.
 It is therefore customary to wrap \co{wait()} into a function similar
 to the \apipx{waitall()} function shown in
-Listing~\ref{lst:toolsoftrade:Using the wait() Primitive}
+\cref{lst:toolsoftrade:Using the wait() Primitive}
 (\path{api-pthreads.h}),
 with this \co{waitall()} function having semantics similar to the
 shell-script \co{wait} command.
 Each pass through the loop spanning \clnrefrange{loopa}{loopb}
 waits on one child process.
-Line~\lnref{wait} invokes the \co{wait()} primitive, which blocks
+\Clnref{wait} invokes the \co{wait()} primitive, which blocks
 until a child process exits, and returns that child's process ID\@.
 If the process ID is instead $-1$, this indicates that the \co{wait()}
 primitive was unable to wait on a child.
-If so, line~\lnref{ECHILD} checks for the \co{ECHILD} errno, which
+If so, \clnref{ECHILD} checks for the \co{ECHILD} errno, which
 indicates that there are no more child processes, so that
-line~\lnref{break} exits the loop.
-Otherwise, lines~\lnref{perror} and~\lnref{exit} print an error and exit.
+\clnref{break} exits the loop.
+Otherwise, \clnref{perror,exit} print an error and exit.
 \end{fcvref}
 
 \QuickQuiz{
@@ -266,7 +265,7 @@ Otherwise, lines~\lnref{perror} and~\lnref{exit} print an error and exit.
 	child individually.
 	In addition, some parallel applications need to detect the
 	reason that the child died.
-	As we saw in Listing~\ref{lst:toolsoftrade:Using the wait() Primitive},
+	As we saw in \cref{lst:toolsoftrade:Using the wait() Primitive},
 	it is not hard to build a \co{waitall()} function out of
 	the \co{wait()} function, but it would be impossible to
 	do the reverse.
@@ -283,12 +282,12 @@ Otherwise, lines~\lnref{perror} and~\lnref{exit} print an error and exit.
 It is critically important to note that the parent and child do \emph{not}
 share memory.
 This is illustrated by the program shown in
-Listing~\ref{lst:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
+\cref{lst:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
 (\path{forkjoinvar.c}),
-in which the child sets a global variable \co{x} to 1 on line~\lnref{setx},
-prints a message on line~\lnref{print:c}, and exits on line~\lnref{exit:s}.
-The parent continues at line~\lnref{waitall}, where it waits on the child,
-and on line~\lnref{print:p} finds that its copy of the variable \co{x} is
+in which the child sets a global variable \co{x} to 1 on \clnref{setx},
+prints a message on \clnref{print:c}, and exits on \clnref{exit:s}.
+The parent continues at \clnref{waitall}, where it waits on the child,
+and on \clnref{print:p} finds that its copy of the variable \co{x} is
 still zero.
 The output is thus as follows:
 \end{fcvref}
@@ -314,7 +313,7 @@ Parent process sees x=0
 	source code of the Linux-kernel implementations themselves.
 
 	It is important to note that the parent process in
-	Listing~\ref{lst:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
+	\cref{lst:toolsoftrade:Processes Created Via fork() Do Not Share Memory}
 	waits until after the child terminates to do its \co{printf()}.
 	Using \co{printf()}'s buffered I/O concurrently to the same file
 	from multiple processes is non-trivial, and is best avoided.
@@ -327,7 +326,7 @@ Parent process sees x=0
 
 The finest-grained parallelism requires shared memory, and
 this is covered in
-Section~\ref{sec:toolsoftrade:POSIX Thread Creation and Destruction}.
+\cref{sec:toolsoftrade:POSIX Thread Creation and Destruction}.
 That said, shared-memory parallelism can be significantly more complex
 than fork-join parallelism.
 
@@ -337,8 +336,8 @@ than fork-join parallelism.
 \begin{fcvref}[ln:toolsoftrade:pcreate:mythread]
 To create a thread within an existing process, invoke the
 \apipx{pthread_create()} primitive, for example, as shown on
-lines~\lnref{create:a} and~\lnref{create:b} of
-Listing~\ref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
+\clnref{create:a,create:b} of
+\cref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
 (\path{pcreate.c}).
 The first argument is a pointer to a \co{pthread_t} in which to store the
 ID of the thread to be created, the second \co{NULL} argument is a pointer
@@ -359,7 +358,7 @@ call \apipx{pthread_exit()}.
 
 \QuickQuiz{
 	If the \co{mythread()} function in
-	Listing~\ref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
+	\cref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
 	can simply return, why bother with \co{pthread_exit()}?
 }\QuickQuizAnswer{
 	In this simple example, there is no reason whatsoever.
@@ -371,7 +370,7 @@ call \apipx{pthread_exit()}.
 }\QuickQuizEnd
 
 \begin{fcvref}[ln:toolsoftrade:pcreate:mythread]
-The \apipx{pthread_join()} primitive, shown on line~\lnref{join},
+The \apipx{pthread_join()} primitive, shown on \clnref{join},
 is analogous to
 the fork-join \apipx{wait()} primitive.
 It blocks until the thread specified by the \co{tid} variable completes
@@ -385,7 +384,7 @@ how the thread in question exits.
 \end{fcvref}
 
 The program shown in
-Listing~\ref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
+\cref{lst:toolsoftrade:Threads Created Via pthread-create() Share Memory}
 produces output as follows, demonstrating that memory is in fact
 shared between the two threads:
 
@@ -470,7 +469,7 @@ lock~\cite{Hoare74}.
 	by many threads, and only occasionally updated'', then
 	POSIX reader-writer locks might be what you are looking for.
 	These are introduced in
-	Section~\ref{sec:toolsoftrade:POSIX Reader-Writer Locking}.
+	\cref{sec:toolsoftrade:POSIX Reader-Writer Locking}.
 
 	Another way to get the effect of multiple threads holding
 	the same lock is for one thread to acquire the lock, and
@@ -489,18 +488,18 @@ lock~\cite{Hoare74}.
 
 \begin{fcvref}[ln:toolsoftrade:lock:reader_writer]
 This exclusive-locking property is demonstrated using the code shown in
-Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
+\cref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 (\path{lock.c}).
-Line~\lnref{lock_a} defines and initializes a POSIX lock named \co{lock_a}, while
-line~\lnref{lock_b} similarly defines and initializes a lock named \co{lock_b}.
-Line~\lnref{x} defines and initializes a shared variable~\co{x}.
+\Clnref{lock_a} defines and initializes a POSIX lock named \co{lock_a}, while
+\clnref{lock_b} similarly defines and initializes a lock named \co{lock_b}.
+\Clnref{x} defines and initializes a shared variable~\co{x}.
 \end{fcvref}
 
 \begin{fcvref}[ln:toolsoftrade:lock:reader_writer:reader]
 \Clnrefrange{b}{e} define a function \co{lock_reader()} which repeatedly
 reads the shared variable \co{x} while holding
 the lock specified by \co{arg}.
-Line~\lnref{cast} casts \co{arg} to a pointer to a \co{pthread_mutex_t}, as
+\Clnref{cast} casts \co{arg} to a pointer to a \co{pthread_mutex_t}, as
 required by the \co{pthread_mutex_lock()} and \co{pthread_mutex_unlock()}
 primitives.
 \end{fcvref}
@@ -508,8 +507,8 @@ primitives.
 \QuickQuizSeries{%
 \QuickQuizB{
 	Why not simply make the argument to \co{lock_reader()}
-	on line~\ref{ln:toolsoftrade:lock:reader_writer:reader:b} of
-	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
+	on \clnrefr{ln:toolsoftrade:lock:reader_writer:reader:b} of
+	\cref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 	be a pointer to a \co{pthread_mutex_t}?
 }\QuickQuizAnswerB{
 	Because we will need to pass \co{lock_reader()} to
@@ -522,9 +521,9 @@ primitives.
 \QuickQuizE{
 	\begin{fcvref}[ln:toolsoftrade:lock:reader_writer]
 	What is the \apik{READ_ONCE()} on
-        lines~\lnref{reader:read_x} and~\lnref{writer:inc} and the
-	\apik{WRITE_ONCE()} on line~\lnref{writer:inc} of
-	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}?
+	\clnref{reader:read_x,writer:inc} and the
+	\apik{WRITE_ONCE()} on \clnref{writer:inc} of
+	\cref{lst:toolsoftrade:Demonstration of Exclusive Locks}?
 	\end{fcvref}
 }\QuickQuizAnswerE{
 	These macros constrain the compiler so as to prevent it from
@@ -534,15 +533,15 @@ primitives.
 	reordering of accesses to a given single variable.
 	Note that this single-variable constraint does apply to the
 	code shown in
-	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
+	\cref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 	because only the variable \co{x} is accessed.
 
 	For more information on \co{READ_ONCE()} and \co{WRITE_ONCE()},
 	please see
-	Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)}.
+	\cref{sec:toolsoftrade:Atomic Operations (gcc Classic)}.
 	For more information on ordering accesses to multiple variables
 	by multiple threads, please see
-	Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
+	\cref{chp:Advanced Synchronization: Memory Ordering}.
 	In the meantime, \co{READ_ONCE(x)} has much in common with
 	the \GCC\  intrinsic \co{__atomic_load_n(&x, __ATOMIC_RELAXED)}
 	and \co{WRITE_ONCE()} has much in common with the \GCC\ 
@@ -557,12 +556,12 @@ for errors and exiting the program if any occur.
 \Clnrefrange{loop:b}{loop:e} repeatedly check the value of \co{x},
 printing the new value
 each time that it changes.
-Line~\lnref{sleep} sleeps for one millisecond, which allows this demonstration
+\Clnref{sleep} sleeps for one millisecond, which allows this demonstration
 to run nicely on a uniprocessor machine.
 \Clnrefrange{rel:b}{rel:e} release the \co{pthread_mutex_t},
 again checking for
 errors and exiting the program if any occur.
-Finally, line~\lnref{return} returns \co{NULL}, again to match the function type
+Finally, \clnref{return} returns \co{NULL}, again to match the function type
 required by \co{pthread_create()}.
 \end{fcvref}
 
@@ -581,11 +580,11 @@ required by \co{pthread_create()}.
 
 \begin{fcvref}[ln:toolsoftrade:lock:reader_writer:writer]
 \Clnrefrange{b}{e} of
-Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
+\cref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 show \co{lock_writer()}, which
 periodically updates the shared variable \co{x} while holding the
 specified \co{pthread_mutex_t}.
-As with \co{lock_reader()}, line~\lnref{cast} casts \co{arg} to a pointer
+As with \co{lock_reader()}, \clnref{cast} casts \co{arg} to a pointer
 to \co{pthread_mutex_t},
 \clnrefrange{acq:b}{acq:e} acquire the specified lock,
 and \clnrefrange{rel:b}{rel:e} release it.
@@ -602,7 +601,7 @@ Finally, \clnrefrange{rel:b}{rel:e} release the lock.
 \end{listing}
 
 \begin{fcvref}[ln:toolsoftrade:lock:same_lock]
-Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
+\Cref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
 shows a code fragment that runs \co{lock_reader()} and
 \co{lock_writer()} as threads using the same lock, namely, \co{lock_a}.
 \Clnrefrange{cr:reader:b}{cr:reader:e} create a thread
@@ -625,7 +624,7 @@ by \co{lock_writer()} while holding the lock.
 \QuickQuiz{
 	Is ``x = 0'' the only possible output from the code fragment
 	shown in
-	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}?
+	\cref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}?
 	If so, why?
 	If not, what other output could appear, and why?
 }\QuickQuizAnswer{
@@ -647,7 +646,7 @@ by \co{lock_writer()} while holding the lock.
 \label{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
 \end{listing}
 
-Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
+\Cref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
 shows a similar code fragment, but this time using different locks:
 \co{lock_a} for \co{lock_reader()} and \co{lock_b} for
 \co{lock_writer()}.
@@ -688,7 +687,7 @@ values of \co{x} stored by \co{lock_writer()}.
 %
 \QuickQuizM{
 	In the code shown in
-	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks},
+	\cref{lst:toolsoftrade:Demonstration of Different Exclusive Locks},
 	is \co{lock_reader()} guaranteed to see all the values produced
 	by \co{lock_writer()}?
 	Why or why not?
@@ -702,18 +701,18 @@ values of \co{x} stored by \co{lock_writer()}.
 %
 \QuickQuizE{
 	Wait a minute here!!!
-	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
+	\Cref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
 	didn't initialize shared variable~\co{x},
 	so why does it need to be initialized in
-	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}?
+	\cref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}?
 }\QuickQuizAnswerE{
-	See line~\ref{ln:toolsoftrade:lock:reader_writer:x} of
-	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
+	See \clnrefr{ln:toolsoftrade:lock:reader_writer:x} of
+	\cref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
 	Because the code in
-	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
+	\cref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
 	ran first, it could rely on the compile-time initialization of~\co{x}.
 	The code in
-	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
+	\cref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
 	ran next, so it had to re-initialize~\co{x}.
 }\QuickQuizEndE
 }
@@ -757,17 +756,17 @@ provided by reader-writer locks.
 \end{listing}
 
 \begin{fcvref}[ln:toolsoftrade:rwlockscale:reader]
-Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}
+\Cref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}
 (\path{rwlockscale.c})
 shows one way of measuring reader-writer lock scalability.
-Line~\lnref{rwlock} shows the definition and initialization of the reader-writer
-lock, line~\lnref{holdtm} shows the \co{holdtime} argument controlling the
+\Clnref{rwlock} shows the definition and initialization of the reader-writer
+lock, \clnref{holdtm} shows the \co{holdtime} argument controlling the
 time each thread holds the reader-writer lock,
-line~\lnref{thinktm} shows the \co{thinktime} argument controlling the time between
+\clnref{thinktm} shows the \co{thinktime} argument controlling the time between
 the release of the reader-writer lock and the next acquisition,
-line~\lnref{rdcnts} defines the \co{readcounts} array into which each reader thread
+\clnref{rdcnts} defines the \co{readcounts} array into which each reader thread
 places the number of times it acquired the lock, and
-line~\lnref{nrdrun} defines the \co{nreadersrunning} variable, which
+\clnref{nrdrun} defines the \co{nreadersrunning} variable, which
 determines when all reader threads have started running.
 
 \Clnrefrange{goflag:b}{goflag:e} define \co{goflag},
@@ -780,7 +779,7 @@ set to \co{GOFLAG_STOP} to terminate the test run.
 
 \begin{fcvref}[ln:toolsoftrade:rwlockscale:reader:reader]
 \Clnrefrange{b}{e} define \co{reader()}, which is the reader thread.
-Line~\lnref{atmc_inc} atomically increments the \co{nreadersrunning} variable
+\Clnref{atmc_inc} atomically increments the \co{nreadersrunning} variable
 to indicate that this thread is now running, and
 \clnrefrange{wait:b}{wait:e} wait for the test to start.
 The \apik{READ_ONCE()} primitive forces the compiler to fetch \co{goflag}
@@ -792,8 +791,8 @@ rights to assume that the value of \co{goflag} would never change.
 \QuickQuizB{
 	Instead of using \apik{READ_ONCE()} everywhere, why not just
 	declare \co{goflag} as \co{volatile} on
-        line~\ref{ln:toolsoftrade:rwlockscale:reader:goflag:e} of
-	Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
+	\clnrefr{ln:toolsoftrade:rwlockscale:reader:goflag:e} of
+	\cref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
 }\QuickQuizAnswerB{
 	A \co{volatile} declaration is in fact a reasonable alternative in
 	this particular case.
@@ -815,7 +814,7 @@ rights to assume that the value of \co{goflag} would never change.
 	Don't we also need memory barriers to make sure
 	that the change in \co{goflag}'s value propagates to the
 	CPU in a timely fashion in
-	Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
+	\cref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}?
 }\QuickQuizAnswerM{
 	No, memory barriers are not needed and won't help here.
 	Memory barriers only enforce ordering among multiple memory
@@ -846,7 +845,7 @@ rights to assume that the value of \co{goflag} would never change.
 	and never from a signal handler, then no.
 	Otherwise, it is quite possible that \apik{READ_ONCE()} is needed.
 	We will see examples of both situations in
-	Section~\ref{sec:count:Signal-Theft Limit Counter Implementation}.
+	\cref{sec:count:Signal-Theft Limit Counter Implementation}.
 
 	This leads to the question of how one thread can gain access to
 	another thread's \apig{__thread} variable, and the answer is that
@@ -866,10 +865,10 @@ number of microseconds,
 \clnrefrange{rel:b}{rel:e} release the lock,
 and \clnrefrange{think:b}{think:e} wait for the specified
 number of microseconds before re-acquiring the lock.
-Line~\lnref{count} counts this lock acquisition.
+\Clnref{count} counts this lock acquisition.
 
-Line~\lnref{mov_cnt} moves the lock-acquisition count to this thread's element of the
-\co{readcounts[]} array, and line~\lnref{return} returns, terminating this thread.
+\Clnref{mov_cnt} moves the lock-acquisition count to this thread's element of the
+\co{readcounts[]} array, and \clnref{return} returns, terminating this thread.
 \end{fcvref}
 
 \begin{figure}
@@ -879,7 +878,7 @@ Line~\lnref{mov_cnt} moves the lock-acquisition count to this thread's element o
 \label{fig:toolsoftrade:Reader-Writer Lock Scalability vs. Microseconds in Critical Section}
 \end{figure}
 
-Figure~\ref{fig:toolsoftrade:Reader-Writer Lock Scalability vs. Microseconds in Critical Section}
+\Cref{fig:toolsoftrade:Reader-Writer Lock Scalability vs. Microseconds in Critical Section}
 shows the results of running this test on a 224-core Xeon system
 with two hardware threads per core for a total of 448 software-visible
 CPUs.
@@ -943,7 +942,7 @@ in fact degraded by about 10\,\% from ideal.
 	increases.
 
 	Some other ways of efficiently handling very small critical
-	sections are described in Chapter~\ref{chp:Deferred Processing}.
+	sections are described in \cref{chp:Deferred Processing}.
 }\QuickQuizEndM
 %
 \QuickQuizM{
@@ -965,12 +964,12 @@ in fact degraded by about 10\,\% from ideal.
 Despite these limitations, reader-writer locking is quite useful in many
 cases, for example when the readers must do high-latency file or network I/O\@.
 There are alternatives, some of which will be presented in
-Chapters~\ref{chp:Counting} and \ref{chp:Deferred Processing}.
+\cref{chp:Counting,chp:Deferred Processing}.
 
 \subsection{Atomic Operations (\GCC\ Classic)}
 \label{sec:toolsoftrade:Atomic Operations (gcc Classic)}
 
-Figure~\ref{fig:toolsoftrade:Reader-Writer Lock Scalability vs. Microseconds in Critical Section}
+\Cref{fig:toolsoftrade:Reader-Writer Lock Scalability vs. Microseconds in Critical Section}
 shows that the overhead of reader-writer locking is most severe for the
 smallest critical sections, so it would be nice to have some other way
 of protecting tiny critical sections.
@@ -978,7 +977,7 @@ One such way uses \IX{atomic} operations.
 \begin{fcvref}[ln:toolsoftrade:rwlockscale:reader:reader]
 We have seen an atomic operation already, namely the
 \apig{__sync_fetch_and_add()} primitive on \clnref{atmc_inc} of
-Listing~\ref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
+\cref{lst:toolsoftrade:Measuring Reader-Writer Lock Scalability}.
 This primitive atomically adds the value of its second argument to
 the value referenced by its first argument, returning the old value
 (which was ignored in this case).
@@ -1050,13 +1049,13 @@ problems~\cite{MauriceHerlihy90a}.
 	they be the fastest possible way to get things done?
 }\QuickQuizAnswer{
 	Unfortunately, no.
-	See Chapter~\ref{chp:Counting} for some stark counterexamples.
+	See \cref{chp:Counting} for some stark counterexamples.
 }\QuickQuizEnd
 
 The \apig{__sync_synchronize()} primitive issues a ``memory barrier'',
 which constrains both the compiler's and the CPU's ability to reorder
 operations, as discussed in
-Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
+\cref{chp:Advanced Synchronization: Memory Ordering}.
 In some cases, it is sufficient to constrain the compiler's ability
 to reorder operations, while allowing the CPU free rein, in which
 case the \apik{barrier()} primitive may be used.
@@ -1064,15 +1063,15 @@ case the \apik{barrier()} primitive may be used.
 In some cases, it is only necessary to ensure that the compiler
 avoids optimizing away a given memory read, in which case the
 \apik{READ_ONCE()} primitive may be used, as it was on \clnref{read_x} of
-Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
+\cref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
 \end{fcvref}
 Similarly, the \apik{WRITE_ONCE()} primitive may be used to prevent the
 compiler from optimizing away a given memory write.
 These last three primitives are not provided directly by \GCC,
 but may be implemented straightforwardly as shown in
-Listing~\ref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)},
+\cref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)},
 and all three are discussed at length in
-Section~\ref{sec:toolsoftrade:Accessing Shared Variables}.
+\cref{sec:toolsoftrade:Accessing Shared Variables}.
 Alternatively, \apialtk{READ_ONCE(x)}{READ_ONCE()} has much in common with
 the \GCC\  intrinsic
 \apialtg{__atomic_load_n(&x, __ATOMIC_RELAXED)}{__atomic_load_n()}
@@ -1123,7 +1122,7 @@ The read-modify-write atomics include
 and
 \apic{atomic_compare_exchange_weak()}.
 These operate in a manner similar to those described in
-Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)},
+\cref{sec:toolsoftrade:Atomic Operations (gcc Classic)},
 but with the addition of memory-order arguments to \co{_explicit}
 variants of all of the operations.
 Without memory-order arguments, all the atomic operations are
@@ -1132,8 +1131,8 @@ For example, ``\apialtc{atomic_load_explicit(&a, memory_order_relaxed)}
 {atomic_load_explicit()}''
 is vaguely similar to the Linux kernel's ``\apik{READ_ONCE()}''.\footnote{
 	Memory ordering is described in more detail in
-	Chapter~\ref{chp:Advanced Synchronization: Memory Ordering} and
-	Appendix~\ref{chp:app:whymb:Why Memory Barriers?}.}
+	\cref{chp:Advanced Synchronization: Memory Ordering} and
+	\cref{chp:app:whymb:Why Memory Barriers?}.}
 
 \subsection{Atomic Operations (Modern \GCC)}
 \label{sec:toolsoftrade:Atomic Operations (Modern gcc)}
@@ -1163,7 +1162,7 @@ this list:
 Per-thread variables, also called thread-specific data, thread-local
 storage, and other less-polite names, are used extremely
 heavily in concurrent code, as will be explored in
-Chapters~\ref{chp:Counting} and~\ref{chp:Data Ownership}.
+\cref{chp:Counting,chp:Data Ownership}.
 POSIX supplies the \apipx{pthread_key_create()} function to create a
 per-thread variable (and return the corresponding key),
 \apipx{pthread_key_delete()} to delete the per-thread variable corresponding
@@ -1260,7 +1259,7 @@ Threads share everything except for per-thread local state,\footnote{
 which includes program counter and stack.
 
 The thread API is shown in
-Listing~\ref{lst:toolsoftrade:Thread API}, and members are described in the
+\cref{lst:toolsoftrade:Thread API}, and members are described in the
 following sections.
 
 \begin{listing}
@@ -1310,7 +1309,7 @@ the like.
 The \apipf{for_each_thread()} macro loops through all threads that exist,
 including all threads that \emph{would} exist if created.
 This macro is useful for handling per-thread variables as will be
-seen in Section~\ref{sec:toolsoftrade:Per-Thread Variables}.
+seen in \cref{sec:toolsoftrade:Per-Thread Variables}.
 
 \subsubsection{\tco{for_each_running_thread()}}
 
@@ -1339,14 +1338,14 @@ a run, so such synchronization is normally not needed.
 
 \subsubsection{Example Usage}
 
-Listing~\ref{lst:toolsoftrade:Example Child Thread} (\path{threadcreate.c})
+\Cref{lst:toolsoftrade:Example Child Thread} (\path{threadcreate.c})
 shows an example hello-world-like child thread.
 As noted earlier, each thread is allocated its own stack, so
 each thread has its own private \co{arg} argument and \co{myarg} variable.
 Each child simply prints its argument and its \apipf{smp_thread_id()}
 before exiting.
 Note that the \co{return} statement on
-line~\ref{ln:intro:threadcreate:thread_test:return} terminates the thread,
+\clnrefr{ln:intro:threadcreate:thread_test:return} terminates the thread,
 returning a \co{NULL} to whoever invokes \apipf{wait_thread()} on this
 thread.
 
@@ -1358,14 +1357,14 @@ thread.
 
 \begin{fcvref}[ln:intro:threadcreate:main]
 The parent program is shown in
-Listing~\ref{lst:toolsoftrade:Example Parent Thread}.
+\cref{lst:toolsoftrade:Example Parent Thread}.
 It invokes \co{smp_init()} to initialize the threading system on
-line~\lnref{smp_init},
+\clnref{smp_init},
 parses arguments on \clnrefrange{parse:b}{parse:e},
-and announces its presence on line~\lnref{announce}.
+and announces its presence on \clnref{announce}.
 It creates the specified number of child threads on
 \clnrefrange{create:b}{create:e},
-and waits for them to complete on line~\lnref{wait}.
+and waits for them to complete on \clnref{wait}.
 Note that \apipf{wait_all_threads()} discards the threads return values,
 as in this case they are all \co{NULL}, which is not very interesting.
 \end{fcvref}
@@ -1390,7 +1389,7 @@ as in this case they are all \co{NULL}, which is not very interesting.
 \label{sec:toolsoftrade:Locking}
 
 A good starting subset of the Linux kernel's locking API is shown in
-Listing~\ref{lst:toolsoftrade:Locking API},
+\cref{lst:toolsoftrade:Locking API},
 each API element being described in the following sections.
 This book's CodeSamples locking API closely follows that of the Linux kernel.
 
@@ -1469,7 +1468,7 @@ STORE r0,counter
 
 However, the \apik{spin_lock()} and \apik{spin_unlock()} primitives
 do have performance consequences, as will be seen in
-Chapter~\ref{chp:Data Structures}.
+\cref{chp:Data Structures}.
 
 \subsection{Accessing Shared Variables}
 \label{sec:toolsoftrade:Accessing Shared Variables}
@@ -1512,32 +1511,32 @@ In (say) the early 1990s, compilers did fewer optimizations, in part
 because there were fewer compiler writers and in part due to the
 relatively small memories of that era.
 Nevertheless, problems did arise, as shown in
-Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style},
+\cref{lst:toolsoftrade:Living Dangerously Early 1990s Style},
 which the compiler is within its rights to transform into
-Listing~\ref{lst:toolsoftrade:C Compilers Can Invent Loads}.
+\cref{lst:toolsoftrade:C Compilers Can Invent Loads}.
 As you can see, the temporary on
-line~\ref{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
-Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
+\clnrefr{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
+\cref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
 has been optimized away, so that \co{global_ptr} will be loaded
 up to three times.
 
 \QuickQuiz{
 	What is wrong with loading
-	Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style}'s
+	\cref{lst:toolsoftrade:Living Dangerously Early 1990s Style}'s
 	\co{global_ptr} up to three times?
 }\QuickQuizAnswer{
 	Suppose that \co{global_ptr} is initially non-\co{NULL},
 	but that some other thread sets \co{global_ptr} to \co{NULL}.
 	\begin{fcvref}[ln:toolsoftrade:C Compilers Can Invent Loads]
-	Suppose further that line~\lnref{if:a} of the transformed code
-	(Listing~\ref{lst:toolsoftrade:C Compilers Can Invent Loads})
+	Suppose further that \clnref{if:a} of the transformed code
+	(\cref{lst:toolsoftrade:C Compilers Can Invent Loads})
 	executes just before \co{global_ptr} is set to \co{NULL} and
-	line~\lnref{if:b} just after.
-	Then line~\lnref{if:a} will conclude that
+	\clnref{if:b} just after.
+	Then \clnref{if:a} will conclude that
         \co{global_ptr} is non-\co{NULL},
-	line~\lnref{if:b} will conclude that it is less than
+	\clnref{if:b} will conclude that it is less than
         \co{high_address},
-	so that line~\lnref{do_low} passes \co{do_low()} a \co{NULL} pointer,
+	so that \clnref{do_low} passes \co{do_low()} a \co{NULL} pointer,
 	which \co{do_low()} just might not be prepared to deal with.
 	\end{fcvref}
 
@@ -1549,15 +1548,15 @@ up to three times.
 	go away on its own.
 }\QuickQuizEnd
 
-Section~\ref{sec:toolsoftrade:Shared-Variable Shenanigans}
+\Cref{sec:toolsoftrade:Shared-Variable Shenanigans}
 describes additional problems caused by plain accesses,
-Sections~\ref{sec:toolsoftrade:A Volatile Solution}
-and~\ref{sec:toolsoftrade:Assembling the Rest of a Solution}
+\cref{sec:toolsoftrade:A Volatile Solution,%
+sec:toolsoftrade:Assembling the Rest of a Solution}
 describe some pre-C11 solutions.
 Of course, where practical, the primitives described in
-Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
+\cref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
 or (especially)
-Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}
+\cref{sec:toolsoftrade:Atomic Operations (C11)}
 should instead be used to avoid \IXpl{data race}, that is, to ensure
 that if there are multiple concurrent accesses to a given
 variable, all of those accesses are loads.
@@ -1584,8 +1583,8 @@ or shared-variable shenanigans, as described below.
 instructions for a single access.
 For example, the compiler could in theory compile the load from
 \co{global_ptr} (see
-line~\ref{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
-Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style})
+\clnrefr{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
+\cref{lst:toolsoftrade:Living Dangerously Early 1990s Style})
 as a series of one-byte loads.
 If some other thread was concurrently setting \co{global_ptr} to
 \co{NULL}, the result might have all but one byte of the pointer
@@ -1679,14 +1678,14 @@ function named \co{do_something_quickly()} repeatedly until the
 variable \co{need_to_stop} was set, and that the compiler can see
 that \co{do_something_quickly()} does not store to \co{need_to_stop}.
 One (unsafe) way to code this is shown in
-Listing~\ref{lst:toolsoftrade:Inviting Load Fusing}.
+\cref{lst:toolsoftrade:Inviting Load Fusing}.
 The compiler might reasonably unroll this loop sixteen times in order
 to reduce the per-invocation of the backwards branch at the end of the
 loop.
 Worse yet, because the compiler knows that \co{do_something_quickly()}
 does not store to \co{need_to_stop}, the compiler could quite reasonably
 decide to check this variable only once, resulting in the code shown in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Loads}.
+\cref{lst:toolsoftrade:C Compilers Can Fuse Loads}.
 \begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Loads]
 Once entered, the loop on
 \clnrefrange{loop:b}{loop:e} will never exit, regardless of how
@@ -1724,21 +1723,21 @@ void t1(void)
 \begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
 The compiler can fuse loads across surprisingly large spans of code.
 For example, in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads},
+\cref{lst:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads},
 \co{t0()} and \co{t1()} run concurrently, and \co{do_something()} and
 \co{do_something_else()} are inline functions.
-Line~\lnref{gp} declares pointer \co{gp}, which C initializes to \co{NULL}
+\Clnref{gp} declares pointer \co{gp}, which C initializes to \co{NULL}
 by default.
-At some point, line~\lnref{wgp} of \co{t0()} stores a non-\co{NULL}
+At some point, \clnref{wgp} of \co{t0()} stores a non-\co{NULL}
 pointer to \co{gp}.
 Meanwhile, \co{t1()} loads from \co{gp} three times on
-lines~\lnref{p1}, \lnref{p2}, and~\lnref{p3}.
-Given that line~\lnref{if} finds that \co{gp} is non-\co{NULL}, one might
-hope that the dereference on line~\lnref{p3} would be guaranteed never
+\clnref{p1,p2,p3}.
+Given that \clnref{if} finds that \co{gp} is non-\co{NULL}, one might
+hope that the dereference on \clnref{p3} would be guaranteed never
 to fault.
 Unfortunately, the compiler is within its rights to fuse the read on
-lines~\lnref{p1} and~\lnref{p3}, which means that if line~\lnref{p1}
-loads \co{NULL} and line~\lnref{p2} loads \co{&myvar}, line~\lnref{p3}
+\clnref{p1,p3}, which means that if \clnref{p1}
+loads \co{NULL} and \clnref{p2} loads \co{&myvar}, \clnref{p3}
 could load \co{NULL}, resulting in a fault.\footnote{
 	\ppl{Will}{Deacon} reports that this happened in the Linux kernel.}
 Note that the intervening \apik{READ_ONCE()} does not prevent the other
@@ -1749,7 +1748,7 @@ from the same variable.
 \QuickQuiz{
 	Why does it matter whether \co{do_something()} and
 	\co{do_something_else()} in
-	Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads}
+	\cref{lst:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads}
 	are inline functions?
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
@@ -1758,7 +1757,7 @@ from the same variable.
 	compiled, the compiler would have to assume that either or both
 	of these two functions might change the value of \co{gp}.
 	This possibility would force the compiler to reload \co{gp}
-	on line~\lnref{p3}, thus avoiding the \co{NULL}-pointer dereference.
+	on \clnref{p3}, thus avoiding the \co{NULL}-pointer dereference.
 	\end{fcvref}
 }\QuickQuizEnd
 
@@ -1798,25 +1797,25 @@ void work_until_shut_down(void)
 \end{listing}
 
 However, there are exceptions, for example as shown in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}.
+\cref{lst:toolsoftrade:C Compilers Can Fuse Stores}.
 \begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
 The function \co{shut_it_down()} stores to the shared
-variable \co{status} on lines~\lnref{store:a} and~\lnref{store:b},
+variable \co{status} on \clnref{store:a,store:b},
 and so assuming that neither
 \co{start_shutdown()} nor \co{finish_shutdown()} access \co{status},
 the compiler could reasonably remove the store to \co{status} on
-line~\lnref{store:a}.
+\clnref{store:a}.
 Unfortunately, this would mean that \co{work_until_shut_down()} would
 never exit its loop spanning
-lines~\lnref{until:loop:b} and~\lnref{until:loop:e}, and thus would never set
+\clnref{until:loop:b,until:loop:e}, and thus would never set
 \co{other_task_ready}, which would in turn mean that \co{shut_it_down()}
 would never exit its loop spanning
-lines~\lnref{loop:b} and~\lnref{loop:e}, even if
+\clnref{loop:b,loop:e}, even if
 the compiler chooses not to fuse the successive loads from
-\co{other_task_ready} on line~\lnref{loop:b}.
+\co{other_task_ready} on \clnref{loop:b}.
 
 And there are more problems with the code in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores},
+\cref{lst:toolsoftrade:C Compilers Can Fuse Stores},
 including code reordering.
 
 {\bf Code reordering} is a common compilation technique used to
@@ -1824,17 +1823,17 @@ combine common subexpressions, reduce register pressure, and
 improve utilization of the many functional units available on
 modern superscalar microprocessors.
 It is also another reason why the code in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}
+\cref{lst:toolsoftrade:C Compilers Can Fuse Stores}
 is buggy.
 For example, suppose that the \co{do_more_work()} function on
-line~\lnref{until:loop:e}
+\clnref{until:loop:e}
 does not access \co{other_task_ready}.
 Then the compiler would be within its rights to move the assignment
 to \co{other_task_ready} on
-line~\lnref{other:store} to precede line~\lnref{until:loop:b}, which might
+\clnref{other:store} to precede \clnref{until:loop:b}, which might
 be a great disappointment for anyone hoping that the last call to
-\co{do_more_work()} on line~\lnref{until:loop:e} happens before the call to
-\co{finish_shutdown()} on line~\lnref{finish}.
+\co{do_more_work()} on \clnref{until:loop:e} happens before the call to
+\co{finish_shutdown()} on \clnref{finish}.
 \end{fcvref}
 
 It might seem futile to prevent the compiler from changing the order of
@@ -1853,8 +1852,8 @@ independent of the ordering provided by the underlying hardware.\footnote{
 	of \apik{READ_ONCE()} and \apik{WRITE_ONCE()}.}
 
 {\bf Invented loads} were illustrated by the code in
-Listings~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
-and~\ref{lst:toolsoftrade:C Compilers Can Invent Loads},
+\cref{lst:toolsoftrade:Living Dangerously Early 1990s Style,%
+lst:toolsoftrade:C Compilers Can Invent Loads},
 in which the compiler optimized away a temporary variable,
 thus loading from a shared variable more often than intended.
 
@@ -1868,9 +1867,9 @@ both performance and scalability.
 \begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
 {\bf Invented stores} can occur in a number of situations.
 For example, a compiler emitting code for \co{work_until_shut_down()} in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores}
+\cref{lst:toolsoftrade:C Compilers Can Fuse Stores}
 might notice that \co{other_task_ready} is not accessed by
-\co{do_more_work()}, and stored to on line~\lnref{other:store}.
+\co{do_more_work()}, and stored to on \clnref{other:store}.
 If \co{do_more_work()} was a complex inline function, it might be
 necessary to do a register spill, in which case one attractive
 place to use for temporary storage is \co{other_task_ready}.
@@ -1878,7 +1877,7 @@ After all, there are no accesses to it, so what is the harm?
 
 Of course, a non-zero store to this variable at just the wrong time
 would result in the \co{while} loop on
-line~\lnref{loop:b} terminating
+\clnref{loop:b} terminating
 prematurely, again allowing \co{finish_shutdown()} to run
 concurrently with \co{do_more_work()}.
 Given that the entire point of this \co{while} appears to be to
@@ -1916,19 +1915,19 @@ Using a stored-to variable as a temporary might seem outlandish,
 but it is permitted by the standard.
 Nevertheless, readers might be justified in wanting a less
 outlandish example, which is provided by
-Listings~\ref{lst:toolsoftrade:Inviting an Invented Store}
-and~\ref{lst:toolsoftrade:Compiler Invents an Invited Store}.
+\cref{lst:toolsoftrade:Inviting an Invented Store,%
+lst:toolsoftrade:Compiler Invents an Invited Store}.
 
 A compiler emitting code for
-Listing~\ref{lst:toolsoftrade:Inviting an Invented Store}
+\cref{lst:toolsoftrade:Inviting an Invented Store}
 might know that the value of \co{a} is initially zero,
 which might be a strong temptation to optimize away one branch
 by transforming this code to that in
-Listing~\ref{lst:toolsoftrade:Compiler Invents an Invited Store}.
+\cref{lst:toolsoftrade:Compiler Invents an Invited Store}.
 \begin{fcvref}[ln:toolsoftrade:Compiler Invents an Invited Store]
-Here, line~\lnref{store:uncond} unconditionally stores \co{1} to \co{a}, then
+Here, \clnref{store:uncond} unconditionally stores \co{1} to \co{a}, then
 resets the value back to zero on
-line~\lnref{store:cond} if \co{condition} was not set.
+\clnref{store:cond} if \co{condition} was not set.
 This transforms the if-then-else into an if-then, saving one branch.
 \end{fcvref}
 
@@ -1984,18 +1983,18 @@ p = NULL;\lnlbl[null]
 that a plain store might not actually change the value in memory.
 \begin{fcvref}[ln:toolsoftrade:Inviting a Store-to-Load Conversion]
 For example, consider
-Listing~\ref{lst:toolsoftrade:Inviting a Store-to-Load Conversion}.
-Line~\lnref{load:p} fetches \co{p}, but the \qco{if} statement on
-line~\lnref{if} also tells the compiler that the developer thinks that
+\cref{lst:toolsoftrade:Inviting a Store-to-Load Conversion}.
+\Clnref{load:p} fetches \co{p}, but the \qco{if} statement on
+\clnref{if} also tells the compiler that the developer thinks that
 \co{p} is usually zero.\footnote{
 	The \apik{unlikely()} function provides this hint to the compiler,
 	and different compilers provide different ways of implementing
 	\co{unlikely()}.}
-The \apik{barrier()} statment on line~\lnref{barrier} forces the compiler
+The \apik{barrier()} statment on \clnref{barrier} forces the compiler
 to forget the value of \co{p}, but one could imagine a compiler
 choosing to remember the hint---or getting an additional hint via
 feedback-directed optimization.
-Doing so would cause the compiler to realize that line~\lnref{null}
+Doing so would cause the compiler to realize that \clnref{null}
 is often an expensive no-op.
 \end{fcvref}
 
@@ -2016,8 +2015,8 @@ if (p != NULL)\lnlbl[if1]
 
 \begin{fcvref}[ln:toolsoftrade:Compiler Converts a Store to a Load]
 Such a compiler might therefore guard the store of \co{NULL}
-with a check, as shown on lines~\lnref{if1} and~\lnref{null} of
-Listing~\ref{lst:toolsoftrade:Compiler Converts a Store to a Load}.
+with a check, as shown on \clnref{if1,null} of
+\cref{lst:toolsoftrade:Compiler Converts a Store to a Load}.
 Although this transformation is often desirable, it could be problematic
 if the actual store was required for ordering.
 For example, a write memory barrier (Linux kernel \apik{smp_wmb()}) would
@@ -2042,8 +2041,8 @@ might thus eliminate a variable that the external code relies upon.
 Reliable concurrent code clearly needs a way to cause the compiler to
 preserve the number, order, and type of important accesses to shared
 memory, a topic taken up by
-Sections~\ref{sec:toolsoftrade:A Volatile Solution}
-and~\ref{sec:toolsoftrade:Assembling the Rest of a Solution},
+\cref{sec:toolsoftrade:A Volatile Solution,%
+sec:toolsoftrade:Assembling the Rest of a Solution},
 which are up next.
 
 \subsubsection{A Volatile Solution}
@@ -2114,7 +2113,7 @@ constraints~\cite{PaulEMcKenney2016P0124R6-LKMM}:
 	Concurrent code relies on this constraint in order to achieve
 	the desired ordering properties from combinations of volatile
 	accesses and other means discussed in
-	Section~\ref{sec:toolsoftrade:Assembling the Rest of a Solution}.
+	\cref{sec:toolsoftrade:Assembling the Rest of a Solution}.
 \end{enumerate}
 
 Concurrent code also relies on the first two constraints to avoid
@@ -2139,11 +2138,11 @@ if (ptr != NULL && ptr < high_address)
 \end{listing}
 
 Using \apik{READ_ONCE()} on
-line~\ref{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
-Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
+\clnrefr{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
+\cref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
 avoids invented loads,
 resulting in the code shown in
-Listing~\ref{lst:toolsoftrade:Avoiding Danger; 2018 Style}.
+\cref{lst:toolsoftrade:Avoiding Danger; 2018 Style}.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Preventing Load Fusing]
@@ -2157,9 +2156,9 @@ while (!READ_ONCE(need_to_stop))
 \end{listing}
 
 As shown in
-Listing~\ref{lst:toolsoftrade:Preventing Load Fusing},
+\cref{lst:toolsoftrade:Preventing Load Fusing},
 \apik{READ_ONCE()} can also prevent the loop unrolling in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Loads}.
+\cref{lst:toolsoftrade:C Compilers Can Fuse Loads}.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Preventing Store Fusing and Invented Stores]
@@ -2189,12 +2188,12 @@ void work_until_shut_down(void)
 
 \apik{READ_ONCE()} and \apik{WRITE_ONCE()} can also be used to prevent the
 store fusing and invented stores that were shown in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores},
+\cref{lst:toolsoftrade:C Compilers Can Fuse Stores},
 with the result shown in
-Listing~\ref{lst:toolsoftrade:Preventing Store Fusing and Invented Stores}.
+\cref{lst:toolsoftrade:Preventing Store Fusing and Invented Stores}.
 However, this does nothing to prevent code reordering, which requires
 some additional tricks taught in
-Section~\ref{sec:toolsoftrade:Assembling the Rest of a Solution}.
+\cref{sec:toolsoftrade:Assembling the Rest of a Solution}.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Disinviting an Invented Store]
@@ -2211,9 +2210,9 @@ else
 
 Finally, \apik{WRITE_ONCE()} can be used to prevent the store invention
 shown in
-Listing~\ref{lst:toolsoftrade:Inviting an Invented Store},
+\cref{lst:toolsoftrade:Inviting an Invented Store},
 with the resulting code shown in
-Listing~\ref{lst:toolsoftrade:Disinviting an Invented Store}.
+\cref{lst:toolsoftrade:Disinviting an Invented Store}.
 
 To summarize, the \apic{volatile} keyword can prevent load
 tearing and store tearing in cases where the loads and stores are
@@ -2236,7 +2235,7 @@ Additional ordering has traditionally been provided by recourse to
 assembly language, for example, \GCC\ asm directives.
 Oddly enough, these directives need not actually contain assembly language,
 as exemplified by the \apik{barrier()} macro shown in
-Listing~\ref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)}.
+\cref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)}.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Preventing C Compilers From Fusing Loads]
@@ -2260,12 +2259,12 @@ this do-nothing asm can arbitrarily change memory.
 In response, the compiler will avoid moving any memory references across
 the \apik{barrier()} macro.
 This means that the real-time-destroying loop unrolling shown in
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Loads}
+\cref{lst:toolsoftrade:C Compilers Can Fuse Loads}
 can be prevented by adding \apik{barrier()} calls as shown on
-lines~\ref{ln:toolsoftrade:Preventing C Compilers From Fusing Loads:b1}
-and~\ref{ln:toolsoftrade:Preventing C Compilers From Fusing Loads:b2}
+\clnrefr{ln:toolsoftrade:Preventing C Compilers From Fusing Loads:b1,%
+ln:toolsoftrade:Preventing C Compilers From Fusing Loads:b2}
 of
-Listing~\ref{lst:toolsoftrade:Preventing C Compilers From Fusing Loads}.
+\cref{lst:toolsoftrade:Preventing C Compilers From Fusing Loads}.
 These two lines of code prevent the compiler from pushing the load from
 \co{need_to_stop} into or past \co{do_something_quickly()} from either
 direction.
@@ -2307,19 +2306,18 @@ references.
 In many cases, this is not a problem because the hardware can only do
 a certain amount of reordering.
 However, there are cases such as
-Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores} where the
+\cref{lst:toolsoftrade:C Compilers Can Fuse Stores} where the
 hardware must be constrained.
-Listing~\ref{lst:toolsoftrade:Preventing Store Fusing and Invented Stores}
+\Cref{lst:toolsoftrade:Preventing Store Fusing and Invented Stores}
 prevented store fusing and invention, and
-Listing~\ref{lst:toolsoftrade:Preventing Reordering}
+\cref{lst:toolsoftrade:Preventing Reordering}
 further prevents the remaining reordering by addition of
 \apik{smp_mb()} on
 \begin{fcvref}[ln:toolsoftrade:Preventing Reordering]
-lines~\lnref{mb1}, \lnref{mb2}, \lnref{mb3}, \lnref{mb4},
-and~\lnref{mb5}.
+\clnref{mb1,mb2,mb3,mb4,mb5}.
 \end{fcvref}
 The \apik{smp_mb()} macro is similar to \apik{barrier()} shown in
-Listing~\ref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)},
+\cref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)},
 but with the empty string replaced by a string containing the
 instruction for a full memory barrier, for example, \co{"mfence"}
 on x86 or \co{"sync"} on PowerPC.
@@ -2327,23 +2325,23 @@ on x86 or \co{"sync"} on PowerPC.
 \QuickQuiz{
 	But aren't full memory barriers very heavyweight?
 	Isn't there a cheaper way to enforce the ordering needed in
-	Listing~\ref{lst:toolsoftrade:Preventing Reordering}?
+	\cref{lst:toolsoftrade:Preventing Reordering}?
 }\QuickQuizAnswer{
 	As is often the case, the answer is ``it depends''.
 	However, if only two threads are accessing the \co{status}
 	and \co{other_task_ready} variables, then the
 	\apik{smp_store_release()} and \apik{smp_load_acquire()}
 	functions discussed in
-	Section~\ref{sec:toolsoftrade:Atomic Operations}
+	\cref{sec:toolsoftrade:Atomic Operations}
 	will suffice.
 }\QuickQuizEnd
 
 Ordering is also provided by some read-modify-write atomic
 operations, some of which are presented in
-Section~\ref{sec:toolsoftrade:Atomic Operations}.
+\cref{sec:toolsoftrade:Atomic Operations}.
 In the general case, memory ordering can be quite subtle, as
 discussed in
-Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
+\cref{chp:Advanced Synchronization: Memory Ordering}.
 The next section covers an alternative to memory ordering, namely
 limiting or even entirely avoiding data races.
 
@@ -2360,10 +2358,10 @@ shared variables!''
 The doctor's advice might seem unhelpful, but
 one time-tested way to avoid concurrently accessing shared variables
 is access those variables only when holding a particular lock, as will
-be discussed in Chapter~\ref{chp:Locking}.
+be discussed in \cref{chp:Locking}.
 Another way is to access a given ``shared'' variable only from a given
 CPU or thread, as will be discussed in
-Chapter~\ref{chp:Data Ownership}.
+\cref{chp:Data Ownership}.
 It is possible to combine these two approaches, for example, a given
 variable might be modified only by a given CPU or thread while holding a
 particular lock, and might be read either from that same CPU or thread
@@ -2431,12 +2429,12 @@ use \apik{READ_ONCE()} and \apik{WRITE_ONCE()} or stronger, respectively.
 But it bears repeating that neither \apik{READ_ONCE()} nor \apik{WRITE_ONCE()}
 provide any ordering guarantees other than within the compiler.
 See the above
-Section~\ref{sec:toolsoftrade:Assembling the Rest of a Solution} or
-Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}
+\cref{sec:toolsoftrade:Assembling the Rest of a Solution} or
+\cref{chp:Advanced Synchronization: Memory Ordering}
 for information on such guarantees.
 
 Examples of many of these data-race-avoidance patterns are presented in
-Chapter~\ref{chp:Counting}.
+\cref{chp:Counting}.
 
 \subsection{Atomic Operations}
 \label{sec:toolsoftrade:Atomic Operations}
@@ -2482,7 +2480,7 @@ given per-CPU variable, \apik{per_cpu()} to access a specified CPU's
 instance of a given per-CPU variable, along with many other special-purpose
 per-CPU operations.
 
-Listing~\ref{lst:toolsoftrade:Per-Thread-Variable API}
+\Cref{lst:toolsoftrade:Per-Thread-Variable API}
 shows this book's per-thread-variable API, which is patterned
 after the Linux kernel's per-CPU-variable API\@.
 This API provides the per-thread equivalent of global variables.
@@ -2558,7 +2556,7 @@ the CPU-online process.
 Suppose that we have a counter that is incremented very frequently
 but read out quite rarely.
 As will become clear in
-Section~\ref{sec:count:Statistical Counters},
+\cref{sec:count:Statistical Counters},
 it is helpful to implement such a counter using a per-thread variable.
 Such a variable can be defined as follows:
 
@@ -2591,7 +2589,7 @@ for_each_thread(t)
 Again, it is possible to gain a similar effect using other mechanisms,
 but per-thread variables combine convenience and high performance,
 as will be shown in more detail in
-Section~\ref{sec:count:Statistical Counters}.
+\cref{sec:count:Statistical Counters}.
 
 \section{The Right Tool for the Job: How to Choose?}
 \label{sec:toolsoftrade:The Right Tool for the Job: How to Choose?}
@@ -2612,14 +2610,14 @@ might need to use the POSIX threading primitives, choosing the appropriate
 locking and/or atomic-operation primitives.
 If the overhead of the POSIX threading primitives (typically sub-microsecond)
 is too great, then the primitives introduced in
-Chapter~\ref{chp:Deferred Processing} may be required.
+\cref{chp:Deferred Processing} may be required.
 Of course, the actual overheads will depend not only on your hardware,
 but most critically on the manner in which you use the primitives.
 Furthermore, always remember that inter-process communication and
 message-passing can be good alternatives to shared-memory multithreaded
 execution, especially when your code makes good use of the design
 principles called out in
-Chapter~\ref{cha:Partitioning and Synchronization Design}.
+\cref{cha:Partitioning and Synchronization Design}.
 
 \QuickQuiz{
 	Wouldn't the shell normally use \apipx{vfork()} rather than
@@ -2636,22 +2634,22 @@ Because concurrency was added to the C standard several decades after
 the C language was first used to build concurrent systems, there are
 a number of ways of concurrently accessing shared variables.
 All else being equal, the C11 standard operations described in
-Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}
+\cref{sec:toolsoftrade:Atomic Operations (C11)}
 should be your first stop.
 If you need to access a given shared variable both with \IXplx{plain access}{es}
 and atomically, then the modern \GCC\ atomics described in
-Section~\ref{sec:toolsoftrade:Atomic Operations (Modern gcc)}
+\cref{sec:toolsoftrade:Atomic Operations (Modern gcc)}
 might work well for you.
 If you are working on an old codebase that uses the classic \GCC\ \co{__sync}
 API, then you should review
-Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
+\cref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
 as well as the relevant \GCC\ documentation.
 If you are working on the Linux kernel or similar codebase that
 combines use of the \apic{volatile} keyword with inline assembly,
 or if you need dependencies to provide ordering, look at the material
-presented in Section~\ref{sec:toolsoftrade:Accessing Shared Variables}
+presented in \cref{sec:toolsoftrade:Accessing Shared Variables}
 as well as that in
-Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
+\cref{chp:Advanced Synchronization: Memory Ordering}.
 
 Whatever approach you take, please keep in mind that randomly hacking
 multi-threaded code is a spectacularly bad idea, especially given that
-- 
2.17.1



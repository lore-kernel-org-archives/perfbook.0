Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48908 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729098AbeKLCfc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 11 Nov 2018 21:35:32 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wABGkUXQ100822
        for <perfbook@vger.kernel.org>; Sun, 11 Nov 2018 11:46:30 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2npdbgcb7r-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 11 Nov 2018 11:46:30 -0500
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 11 Nov 2018 16:45:01 -0000
Date: Sun, 11 Nov 2018 08:45:00 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] styleguide: Update code snippet section
Reply-To: paulmck@linux.ibm.com
References: <8c68ad49-6c54-6ff1-e50d-09337be505c2@gmail.com>
 <20181111160337.GS4170@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181111160337.GS4170@linux.ibm.com>
Message-Id: <20181111164500.GU4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 11, 2018 at 08:03:37AM -0800, Paul E. McKenney wrote:
> On Sun, Nov 11, 2018 at 11:44:54PM +0900, Akira Yokosawa wrote:
> > >From c821c6c678197b760a4c08c7bfdba370bdd31a71 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Mon, 11 Nov 2018 23:30:04 +0900
> > Subject: [PATCH] styleguide: Update code snippet section
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > Hi Paul,
> > 
> > This updates Style Guide to describe new scheme of code snippet.
> > Although there still remain rough edges, hopefully it would cover
> > essential info.
> 
> Very good, thank you!  I was unaware of some of the restrictions for
> comments in litmus tests, so this is very welcome documentation.  ;-)
> 
> Queued, will be pushed soon.

And of course when reading it, I could not resist the urge to make
a couple of edits.  Please note that your use of "obsolescent" is not
wrong, just a bit unusual, hence my substitution of "obsolete".
Please see below for a delta patch which I merged into your original,
and please let me know if I messed anything up.

Oh, and \qco{} looks handy!  ;-)

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/appendix/styleguide/samplecodesnippetlst.tex b/appendix/styleguide/samplecodesnippetlst.tex
index 65a1f489587d..b18922e763b3 100644
--- a/appendix/styleguide/samplecodesnippetlst.tex
+++ b/appendix/styleguide/samplecodesnippetlst.tex
@@ -14,6 +14,6 @@ int main(void)
 }
 \centering
 \theverbbox
-\caption{Sample Code Snippet (Obsolescent)}
-\label{lst:app:styleguide:Sample Code Snippet (Obsolesc)}
+\caption{Sample Code Snippet (Obsolete)}
+\label{lst:app:styleguide:Sample Code Snippet (Obsolete)}
 \end{listing}
diff --git a/appendix/styleguide/samplecodesnippetlstlbl.tex b/appendix/styleguide/samplecodesnippetlstlbl.tex
index 8ee8b5d4acf2..d3e4a9533d89 100644
--- a/appendix/styleguide/samplecodesnippetlstlbl.tex
+++ b/appendix/styleguide/samplecodesnippetlstlbl.tex
@@ -14,6 +14,6 @@ int main(void)
 }
 \centering
 \theverbbox			%lnlbl@theverbbox$
-\caption{Sample Code Snippet (Obsolescent)}
-\label{lst:app:styleguide:Sample Code Snippet (Obsolesc)}
+\caption{Sample Code Snippet (Obsolete)}
+\label{lst:app:styleguide:Sample Code Snippet (Obsolete)}
 \end{listing}
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 0a94c1c93555..058789803f59 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -322,7 +322,7 @@ This section explains the use cases of such macros and environments.
 \subsubsection{Code Snippet}
 \label{sec:app:styleguide:Code Snippet}
 
-Although the \qco{verbatim} environment is a primitve way to include
+Because the \qco{verbatim} environment is a primitve way to include
 listings, we are transitioning to a new scheme which uses
 the \qco{fancyvrb} package for code snippets.
 
@@ -351,7 +351,7 @@ They are defined in the preamble as shown below:
 
 We used to use the \qco{verbbox} environment provided
 by the \qco{verbatimbox} package. As will be described later in
-Section~\ref{sec:app:styleguide:Code Snippet (Obsolesc)},
+Section~\ref{sec:app:styleguide:Code Snippet (Obsolete)},
 \co{verbbox} has the capability of automatic
 line numbering. However, it is not possible to embed labels on lines
 in the snippet to refer from the text.
@@ -516,7 +516,7 @@ exists (0:r1=0)  // comment after test body
 \end{VerbatimN}
 \end{linelabel}
 
-To avoid parse error, meta commands in litmus tests (C flavour) are embedded
+To avoid parse errors, meta commands in litmus tests (C flavour) are embedded
 in the following way.
 
 \begin{linelabel}[ln:app:styleguide:Sample Source of Litmus Test]
@@ -601,14 +601,14 @@ Note that each litmus test's source file can contain at most one
 pair of \co{\\begin[snippet]} and \co{\\end[snippet]} because of
 the restriction of comments.
 
-\subsubsection{Code Snippet (Obsolescent)}
-\label{sec:app:styleguide:Code Snippet (Obsolesc)}
+\subsubsection{Code Snippet (Obsolete)}
+\label{sec:app:styleguide:Code Snippet (Obsolete)}
 
 Sample \LaTeX\ source of a code snippet coded using
 the \qco{verbatimbox} package is shown in
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
 and is typeset as shown in
-Listing~\ref{lst:app:styleguide:Sample Code Snippet (Obsolesc)}.
+Listing~\ref{lst:app:styleguide:Sample Code Snippet (Obsolete)}.
 
 \begin{listing}[tb]
 \begin{linelabel}[ln:app:styleguide:samplecodesnippetlstlbl]
@@ -616,8 +616,8 @@ Listing~\ref{lst:app:styleguide:Sample Code Snippet (Obsolesc)}.
 \VerbatimInput{appendix/styleguide/samplecodesnippetlstlbl.tex}
 \end{linelabel}
 \vspace*{-9pt}
-\caption{\LaTeX\ Source of Sample Code Snippet (Obsolescent)}
-\label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}
+\caption{\LaTeX\ Source of Sample Code Snippet (Obsolete)}
+\label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
 \end{listing}
 
 \input{appendix/styleguide/samplecodesnippetlst.tex}
@@ -625,7 +625,7 @@ Listing~\ref{lst:app:styleguide:Sample Code Snippet (Obsolesc)}.
 The auto\-/numbering feature of \co{verbbox} is enabled by
 the ``\verb|\LstLineNo|'' macro specified in the option to verbbox
 (line~\ref{ln:app:styleguide:samplecodesnippetlstlbl:lineno} in
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}).
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}).
 The macro is defined in the preamble of \path{perfbook.tex}
 as follows:
 
@@ -865,7 +865,7 @@ Example with a simple dash:
 \begin{quote}
 \begin{lineref}[ln:app:styleguide:samplecodesnippetlstlbl]
   Lines~\lnref{b}\=/\lnref{e} in
-  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}
+  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
   are the contents of the verbbox environment. The box is output
   by the \co{\\theverbbox} macro on line~\lnref{theverbbox}.
 \end{lineref}
@@ -876,7 +876,7 @@ Example with an en dash:
 \begin{quote}
 \begin{lineref}[ln:app:styleguide:samplecodesnippetlstlbl]
   Lines~\lnref{b}\==\lnref{e} in
-  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}
+  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
   are the contents of the verbbox environment. The box is output
   by the \co{\\theverbbox} macro on line~\lnref{theverbbox}.
 \end{lineref}


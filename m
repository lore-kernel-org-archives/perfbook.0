Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbgBXDg7 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 23 Feb 2020 22:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582515419;
        bh=XJDFvX9KYq2nCVvCYpDL9bSXATW9q5Buo09cSBXzLgQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KsTkwXoWf1lFxYjTw/QJDF4VZttftg37EsWPyIjbHvOb+1NoNPujmu6tnzE+/Ciom
         KDRiFnkpbLQvbDBAOqWyQI/3lmKcqzyI8KBByFv1+JwL2N6bw044V9+qmfagwQWcem
         pn7o9H6LbKUaz6qiHpK2DVGar/M3S1VoegzxUxIY=
Date: Sun, 23 Feb 2020 19:36:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/2] Revert "Improve definition of \nbco{} and \qco{}"
Message-ID: <20200224033658.GI2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <ca6192b8-eeb4-4b9d-ba29-d46609fb340b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6192b8-eeb4-4b9d-ba29-d46609fb340b@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>, perfbook@vger.kernel.org

On Mon, Feb 24, 2020 at 08:03:37AM +0900, Akira Yokosawa wrote:
> >From 5403e5522302c78dc95b38f538e3fd09321d1622 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 9 Feb 2020 08:31:09 +0900
> Subject: [PATCH 1/2] Revert "Improve definition of \nbco{} and \qco{}"
> 
> This reverts commit 99b31e87fd0d7eb58b95b80af82a05b693b5aea2.
> 
> Update in upstream LaTeX has broken "examplep" package.
> As a workaround, revert the commit introduced examplep.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed both, thank you!

							Thanx, Paul

> ---
>  appendix/styleguide/styleguide.tex | 61 +++++++++++++++---------------
>  perfbook.tex                       |  3 +-
>  2 files changed, 31 insertions(+), 33 deletions(-)
> 
> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> index fb5671c3..275cb28b 100644
> --- a/appendix/styleguide/styleguide.tex
> +++ b/appendix/styleguide/styleguide.tex
> @@ -107,7 +107,7 @@ are used behind numerical values, narrow spaces should be placed between
>  the values and the symbols.
>  
>  A narrow space can be coded in \LaTeX{} by the sequence of
> -\qco{\,}.
> +\qco{\\,}.
>  For example,
>  \begin{quote}
>    ``2.4\,GHz'', rather then ``2.4GHz''.
> @@ -123,17 +123,17 @@ should be placed. For example,
>  
>  The symbol of micro (\micro :$10^{-6}$) can be typeset easily by
>  the help of ``gensymb'' \LaTeX\ package.
> -A macro \qco{\micro} can be used in both text and
> +A macro \qco{\\micro} can be used in both text and
>  math modes. To typeset the symbol of ``microsecond'', you can do
> -so by \qco{\micro s}. For example,
> +so by \qco{\\micro s}. For example,
>  \begin{quote}
>    10\,\micro s
>  \end{quote}
>  
> -Note that math mode \qco{\mu} is italic by default and should not
> +Note that math mode \qco{\\mu} is italic by default and should not
>  be used as a prefix. An improper example:
>  \begin{quote}
> -  10\,$\mu $s (math mode \qco{\mu})
> +  10\,$\mu $s (math mode \qco{\\mu})
>  \end{quote}
>  
>  \subsubsection{Non-SI Unit Symbol}
> @@ -183,7 +183,7 @@ of it. NIST style guide clearly states so.
>  
>  The symbol of degree can also be typeset easily by the help of gensymb
>  package.
> -A macro \qco{\degree} can be used in both text and math modes.
> +A macro \qco{\\degree} can be used in both text and math modes.
>  
>  Example:
>  
> @@ -323,7 +323,7 @@ This section summarizes guidelines specific to \LaTeX.
>  
>  Monospace font (or typewriter font) is heavily used in this textbook.
>  First policy regarding monospace font in perfbook is to avoid
> -directly using \qco{\texttt} or \qco{\tt} macro.
> +directly using \qco{\\texttt} or \qco{\\tt} macro.
>  It is highly recommended to use a macro or an environment
>  indicating the reason why you want the font.
>  
> @@ -400,7 +400,7 @@ and is typeset as shown in
>  
>  Labels to lines are specified in \qco{$lnlbl[]} command. The characters
>  specified by \qco{commandchars} option to \co{VarbatimL} environment are
> -used by the \co{fancyvrb} package to substitute ``\co{\\lnlbl\{\}}''
> +used by the \co{fancyvrb} package to substitute \qco{\\lnlbl\{\}}
>  for \qco{$lnlbl[]}. Those characters should be selected so that they
>  don't appear elsewhere in the code snippet.
>  
> @@ -424,7 +424,7 @@ to from text.
>  \end{fcvref}
>  \end{quote}
>  
> -Macros ``\co{\\lnlbl\{\}}'' and ``\co{\\lnref\{\}}'' are defined in
> +Macros \qco{\\lnlbl\{\}} and \qco{\\lnref\{\}} are defined in
>  the preamble as follows:
>  
>  \begin{VerbatimU}
> @@ -507,13 +507,13 @@ and must come at the end of options listed above.
>  Other types of options, if any, are also passed to the \co{VerbatimL}
>  environment.
>  
> -The \qco{\lnlbl} commands are converted along the way to reflect
> +The \qco{\\lnlbl} commands are converted along the way to reflect
>  the escape-character choice.\footnote{
> -	Characters forming comments around the \qco{\lnlbl} commands
> +	Characters forming comments around the \qco{\\lnlbl} commands
>  	are also gobbled up regardless of the \qco{keepcomment} setting.
>  }
> -Source lines with \qco{\fcvexclude} are removed.
> -\qco{\fcvblank} can be used to keep blank lines when the
> +Source lines with \qco{\\fcvexclude} are removed.
> +\qco{\\fcvblank} can be used to keep blank lines when the
>  \qco{gobbleblank=yes} option is specified.
>  
>  There can be multiple pairs of \co{\\begin\{snippet\}} and \co{\\end\{snippet\}}
> @@ -543,14 +543,14 @@ Once one of them appears in a litmus test, comments should be of
>  OCaml style (\qco{(* ... *)}). Those tokens keep the same meaning
>  even when they appear in comments!
>  
> -The pair of characters ``\co{\{}'' and ``\co{\}}'' also have special
> -meaning in the C flavor tests. They are used to separate portions
> +The pair of characters \qco{\{} and \qco{\}} also have special
> +meaning in the C flavour tests. They are used to separate portions
>  in a litmus test.
>  
> -First pair of ``\co{\{}'' and ``\co{\}}'' encloses initialization part.
> -Comments in this part should also be in the OCaml form.
> +First pair of \qco{\{} and \qco{\}} encloses initialization part.
> +Comments in this part should also be in the ocaml form.
>  
> -You can't use ``\co{\{}'' nor ``\co{\}}'' in comments in litmus tests, either.
> +You can't use \qco{\{} and \qco{\}} in comments in litmus tests, either.
>  
>  Examples of disallowed comments in a litmus test are shown below:
>  
> @@ -755,9 +755,8 @@ lists such limitations.
>  \begin{tabular}{@{}lll@{}}\toprule
>    Macro &  Need Escape & Should Avoid \\
>    \midrule
> -  \co{\\co}   & \co{\\}, \%, \{, \} & \\
> +  \co{\\co}, \co{\\nbco} & \co{\\}, \%, \{, \} & \\
>    \co{\\tco}  & \# & \%, \{, \}, \co{\\} \\
> -  \co{\\nbco} &    & \%, \{, \}, final \co{\\} \\
>    \bottomrule
>  \end{tabular}
>  \caption{Limitation of Monospace Macro}
> @@ -768,10 +767,10 @@ While \verb|\co{}| requires some characters to be escaped,
>  it can contain any character.
>  
>  On the other hand, \verb|\tco{}| can not handle
> -``\co{\%}'', ``\co{\{}'', ``\co{\}}'', nor ``\co{\\}'' properly.
> -If they are escaped by a~``\co{\\}'',
> +\qco{\%}, \qco{\{}, \qco{\}}, nor \qco{\\} properly.
> +If they are escaped by a~\qco{\\},
>  they appear in the end result with the escape character.
> -The \qco{\verb} command can be used in running text if you
> +The \qco{\\verb} command can be used in running text if you
>  need to use monospace font for a string which contains
>  many characters to escape.\VerbatimFootnotes\footnote{
>    The \verb|\verb| command is not almighty though.
> @@ -886,15 +885,15 @@ in poor typesetting. For example:
>    high-frequency radio wave, high-frequency radio wave.
>  \vspace{0.6\baselineskip}\end{minipage}\end{center}
>  
> -By using a shortcut \qco{\-/} provided by the
> +By using a shortcut \qco{\\-/} provided by the
>  ``extdash'' package, hyphenation in elements of compound
>  words is enabled in perfbook.\footnote{
>    In exchange for enabling the shortcut, we can't use plain
> -  \LaTeX's shortcut \qco{\-} to specify hyphenation points.
> +  \LaTeX's shortcut \qco{\\-} to specify hyphenation points.
>    Use \path{pfhyphex.tex} to add such exceptions.
>  }
>  
> -Example with \qco{\-/}:
> +Example with \qco{\\-/}:
>  
>  \begin{center}\begin{minipage}{2.6in}\vspace{0.6\baselineskip}
>    High\-/frequency radio wave, high\-/frequency radio wave,
> @@ -910,7 +909,7 @@ We want hyphenated compound terms such as ``x\=/coordinate'',
>  following a single letter.
>  
>  To make a hyphen unbreakable, we can use a short cut
> -\qco{\=/} also provided by the ``extdash'' package.
> +\qco{\\=/} also provided by the ``extdash'' package.
>  
>  Example without a shortcut:
>  
> @@ -920,7 +919,7 @@ x-, y-, and z-coordinates; x-, y-, and z-coordinates;
>  x-, y-, and z-coordinates; x-, y-, and z-coordinates;
>  \vspace{0.6\baselineskip}\end{minipage}\end{center}
>  
> -Example with \qco{\-/}:
> +Example with \qco{\\-/}:
>  
>  \begin{center}\begin{minipage}{2.55in}\vspace{0.6\baselineskip}
>  x-, y-, and z\-/coordinates; x-, y-, and z\-/coordinates;
> @@ -928,7 +927,7 @@ x-, y-, and z\-/coordinates; x-, y-, and z\-/coordinates;
>  x-, y-, and z\-/coordinates; x-, y-, and z\-/coordinates;
>  \vspace{0.6\baselineskip}\end{minipage}\end{center}
>  
> -Example with \qco{\=/}:
> +Example with \qco{\\=/}:
>  
>  \begin{center}\begin{minipage}{2.55in}\vspace{0.6\baselineskip}
>  x-, y-, and z\=/coordinates; x-, y-, and z\=/coordinates;
> @@ -936,8 +935,8 @@ x-, y-, and z\=/coordinates; x-, y-, and z\=/coordinates;
>  x-, y-, and z\=/coordinates; x-, y-, and z\=/coordinates;
>  \vspace{0.6\baselineskip}\end{minipage}\end{center}
>  
> -Note that \qco{\=/} enables hyphenation in elements
> -of compound words as the same as \qco{\-/} does.
> +Note that \qco{\\=/} enables hyphenation in elements
> +of compound words as the same as \qco{\\-/} does.
>  
>  \subsubsection{Em Dash}
>  \label{sec:app:styleguide:Em Dash}
> diff --git a/perfbook.tex b/perfbook.tex
> index 87c1eaa1..cc936e47 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -47,7 +47,6 @@
>  \usepackage{changepage}
>  \usepackage{listings}
>  \lstset{basicstyle=\ttfamily}
> -\usepackage{examplep}
>  % \usepackage[strings]{underscore}
>  % \usepackage{underscore}
>  \usepackage{pifont} % symbols for qqz reference points and carriagereturn
> @@ -258,7 +257,7 @@
>  }
>  %%HTMLNOSKIP
>  \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
> -\newcommand{\nbco}[1]{\mbox{\PVerb[pverb-space=invnobreak]{#1}}} % no break lines for short snippet
> +\newcommand{\nbco}[1]{\hbox{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}} % no break lines for short snippet
>  \newcommand{\qco}[1]{``\nbco{#1}''} % \nbco with quotation marks
>  \newcommand{\tco}[1]{\texttt{\detokenize{#1}}} % for code in tabular environment
>  % \tco{} will break at spaces but not at underscores
> -- 
> 2.17.1
> 

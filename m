Return-Path: <SRS0=KNbq=QX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WYD10bDiKN/mcGZDGV44g0uilB1CTS7jZ+5z+r3HFH0=;
        b=e0qtQphT3W9hzXS8+4Vgbpic3TVlzh3d+8jg9mptUOBYnZjlP4NEIqkxY+P0a811/8
         hSC/+41sRgz9QnvhBF2eJTy5QjBjR1d1Ybe3Q3V3p35/Xl1WiHxQ997SEXK9fExJK2+P
         fhdUGW6pll+V+XhQscShjsCHBdhtFur1oS7yZQqM7J/sLqc+TUp56aR2d+Ar9ttk8FiU
         8zf7UgWIgzu+7385obRgmAP2sur24alwRWtlkIIwZ3ZzLh0QEQY37ITZUx+oFrqYYAKr
         0upxJ4HHW/D6jm05DzxKbqPC7jWnzZoaW0ei93Hk3KTt21i3SantioURE+wi/lzyNE/p
         F6kA==
Subject: Re: [PATCH 2/2] defer/rcuusage: Move float objects away of section
 titles
References: <739396e3-6ade-95cf-07dc-098cd8066bde@gmail.com>
 <cc2aa713-25e1-8daf-a381-609b7d217bfb@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2cfde3b7-6135-744f-6e33-aed442d864df@gmail.com>
Date: Mon, 6 Dec 2021 12:57:06 +0900
MIME-Version: 1.0
In-Reply-To: <cc2aa713-25e1-8daf-a381-609b7d217bfb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 6 Dec 2021 12:03:00 +0900, Akira Yokosawa wrote:
> Float objects are treated as page/column break candidates.
> They can cause widowed section titles.

Paul,

I see there remain quite a lot of similar patterns in LaTeX code
of perfbook.

So I'm thinking of adding patterns in cleverefcheck.pl to find
float objects next to headings (\section, \subsection, etc.).

Does this sound reasonable to you?

        Thanks, Akira

> 
> Move a pair of such objects in recently added contents.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  defer/rcuusage.tex | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 01342fda..9f2a428e 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -6,6 +6,14 @@
>  \label{sec:defer:RCU Usage}
>  \OriginallyPublished{Section}{sec:defer:RCU Usage}{RCU Usage}{Linux Weekly News}{PaulEMcKenney2008WhatIsRCUUsage}
>  
> +This section answers the question ``What is RCU?'' from the viewpoint
> +of the uses to which RCU can be put.
> +Because RCU is most frequently used to replace some existing mechanism,
> +we look at it primarily in terms of its relationship to such mechanisms,
> +as listed in \cref{tab:defer:RCU Usage}.
> +Following the sections listed in this table,
> +\cref{sec:defer:RCU Usage Summary} provides a summary.
> +
>  \begin{table}
>  \renewcommand*{\arraystretch}{1.2}
>  \centering
> @@ -40,14 +48,6 @@ Quasi multi-version concurrency control (MVCC) &
>  \label{tab:defer:RCU Usage}
>  \end{table}
>  
> -This section answers the question ``What is RCU?'' from the viewpoint
> -of the uses to which RCU can be put.
> -Because RCU is most frequently used to replace some existing mechanism,
> -we look at it primarily in terms of its relationship to such mechanisms,
> -as listed in \cref{tab:defer:RCU Usage}.
> -Following the sections listed in this table,
> -\cref{sec:defer:RCU Usage Summary} provides a summary.
> -
>  \subsubsection{RCU for Pre-BSD Routing}
>  \label{sec:defer:RCU for Pre-BSD Routing}
>  
> @@ -414,13 +414,6 @@ was shown in the previous sections.
>  \subsubsection{Phased State Change}
>  \label{sec:defer:Phased State Change}
>  
> -\begin{figure}
> -\centering
> -\resizebox{\twocolumnwidth}{!}{\includegraphics{defer/RCUphasedstatechange}}
> -\caption{Phased State Change for Maintenance Operation}
> -\label{fig:defer:Phased State Change for Maintenance Operation}
> -\end{figure}
> -
>  \Cref{fig:defer:Phased State Change for Maintenance Operation}
>  shows a timeline for an example phased state change to efficiently
>  handle maintenance operations.
> @@ -431,6 +424,13 @@ operations must be undertaken carefully, taking into account added
>  complexities due to their running concurrently with that maintenance
>  operation.
>  
> +\begin{figure}
> +\centering
> +\resizebox{\twocolumnwidth}{!}{\includegraphics{defer/RCUphasedstatechange}}
> +\caption{Phased State Change for Maintenance Operation}
> +\label{fig:defer:Phased State Change for Maintenance Operation}
> +\end{figure}
> +
>  In the figure, these apparently conflicting requirements are resolved by
>  having a prepare phase prior to the maintenance operation and a cleanup
>  phase after it, during which the common-case operations can proceed
> 

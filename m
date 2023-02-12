Return-Path: <SRS0=sCbS=6I=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E5SgmLMhBMj7/fxbZaWugKYLubBL9ZnqwTqmzJu+vnI=;
        b=ojQcovSlrZcrAAWbw98RC+81yYcnFETOOLkRXZ0i+bomd5hlo3ppjRmX6Cff8tmXZY
         lPOAaUhB3NedGjCO9AU/6f61unfMwsnJ+8jtfS4bO/A4+s2JGY/+r/ITKn3MA/fcJpWa
         600rI3slm+9bsS5/ViKzfCgKcgJ2igF4Z/J9CvLwmX3n+yTH+8WL7Ua2lKQsZ3KBRxfB
         EX+JEuAB2Pit2iXYZVIfiPP2i3kfukjQfWrsbtg8sSRyajOfORw7Mg3Gk+OeAEfF4HP5
         YcAYcIZSs8DeZhFqxRgeknTKS4C5tkRvi/lZUN7r+ur14wdhKsKTnbl2n6kpFnA28ytR
         BCRg==
Message-ID: <655024e6-72fd-12bd-33f3-dc9700c42f44@gmail.com>
Date: Sun, 12 Feb 2023 21:29:40 +0900
MIME-Version: 1.0
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2 4/4] debugging/debugging: s/remainder of a
 section/following sections/
References: <20230211171008.9415-1-sj38.park@gmail.com>
 <20230211171008.9415-5-sj38.park@gmail.com>
Content-Language: en-US
In-Reply-To: <20230211171008.9415-5-sj38.park@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, sj@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 11 Feb 2023 09:10:08 -0800, SeongJae Park wrote:
> A sectence in 'Microbenchmarking' section is mentioning the remainder of
> the section will look at ways for dealing with conflicts in measurement
> error advices.  Because we don't distinguish section and subsection on
> text, this makes it a little confused, whether it means remainder of the
> subsection, or the following subsections of the section.  Make it a bit
> more clear.
> 
> Suggedsted-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  debugging/debugging.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index b7538620..170bf273 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -641,8 +641,8 @@ sure to take full advantage of any existing test suites available to
>  you.
>  Important as test development is, we must leave further discussion of it
>  to books dedicated to that topic.
> -The following sections therefore discuss locating bugs in your code given that
> -you already have a good test suite.
> +The remainder of this section (\cref{sec:debugging:Performance Estimation})
> +looks at ways of resolving this conflict.

I think this hunk is misplaced. Existing text around here doesn't
have any ambiguity. In other words, "The following sections" means
Sections 11.2 through 11.7 (11.8 is a summary). 

>  
>  \section{Tracing}
>  \label{sec:debugging:Tracing}
> @@ -2302,7 +2302,7 @@ to creep in, including:
>  
>  The first and fourth sources of interference provide conflicting advice,
>  which is one sign that we are living in the real world.
> -The remainder of this section looks at ways of resolving this conflict.
> +The following sections look at ways of resolving this conflict.

To my eyes, this sentence now looks redundant as there already is an
introduction to the following subsections below QQz 11.23.

>  
>  \QuickQuiz{
>  	But what about other sources of error, for example, due to

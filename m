Return-Path: <SRS0=kQd0=JB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=utE/4eAkIURu1p94f4S68rIpvFhfWPI9HKj44o1UtS4=;
        b=YBmiyxKKluIromLrbZysHY6frKhke/EdLVo6SJUCrXTPVNgZwvPRPRqZN3SrC+j9kB
         FyxOGVKOaL0dGtx7C9oGcBTQPn6r9Qt5vvgYiReg2v4IquqhaxJmAoWzCp1Q594R/DNY
         Nqu1mRxjc2kbO4rWkaRnfm4E3tUSO1SUGlb4u+iVksywrRxRm/s9gZs8hG0ugnLWjX9m
         VDMlK+QIoi+XjWDGF9vx6k28gq2AVjaH9oWWqVEokFQ/X0SpsVHU7DTyvjd5tJ+itQba
         GbOgXAegj1bkSZz7sTDcsJP03kMW+Tz+VelokTnpJX+V1Od27VZmltHPoQdTNm174WqT
         aBNQ==
Subject: Re: [PATCH 1/4] howto: Use '\cref' consistently
References: <20210404075010.15858-1-sj38.park@gmail.com>
 <20210404075010.15858-2-sj38.park@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <64aca3cc-3f4a-93d7-0c95-ff44114163a7@gmail.com>
Date: Sun, 4 Apr 2021 18:39:38 +0900
MIME-Version: 1.0
In-Reply-To: <20210404075010.15858-2-sj38.park@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: SeongJae Park <sj38.park@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello SeongJae,

On Sun, 4 Apr 2021 09:50:07 +0200, SeongJae Park wrote:
> 'howto' chapter is using mix of '\cref' and 'Chapter~\ref'.  This commi=
t
> makes it to consistently use the shorter one, '\cref'.
>=20
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  howto/howto.tex | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>=20
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 7de1dbd9..4a00bb3c 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -56,22 +56,22 @@ that it has brought to us!
>  This book is a handbook of widely applicable and heavily
>  used design techniques, rather than
>  a collection of optimal algorithms with tiny areas of applicability.
> -You are currently reading Chapter~\ref{chp:How To Use This Book}, but
> +You are currently reading \cref{chp:How To Use This Book}, but
>  you knew that already.
> -Chapter~\ref{chp:Introduction} gives a high-level overview of parallel=

> +\cref{chp:Introduction} gives a high-level overview of parallel

Please use \Cref{} at the beginning of a sentence.

This does not matter at the moment, but in the long run,
once we finish the conversion to \cref{}/\Cref{}s,
cleveref will allow us to choose other convention of

    Figure 1 ..., Fig. 2 ...

,or

    Figure 1 ..., fig. 2 ...

to save some paper/display area.

Excerpt of cleveref's user manual:

    If you just want to get going quickly with cleveref, and
    come back later to read up on all the features it provides
    in more detail, here=E2=80=99s what you need to do. Wherever you
    would previously have used \ref, use \cref instead.
    (Except at the beginning of a sentence, where you should
    use \Cref.)

>  programming.
> =20
> -Chapter~\ref{chp:Hardware and its Habits} introduces shared-memory
> +\cref{chp:Hardware and its Habits} introduces shared-memory

Ditto.  And there are same patterns below.

Can you fix them and resend the series?

       Thanks, Akira

>  parallel hardware.
>  After all, it is difficult to write good parallel code unless you
>  understand the underlying hardware.
>  Because hardware constantly evolves, this chapter will always be
>  out of date.
>  We will nevertheless do our best to keep up.
> -Chapter~\ref{chp:Tools of the Trade} then provides a very brief overvi=
ew
> +\cref{chp:Tools of the Trade} then provides a very brief overview
>  of common shared-memory parallel-programming primitives.
> =20
> -Chapter~\ref{chp:Counting} takes an in-depth look at parallelizing
> +\cref{chp:Counting} takes an in-depth look at parallelizing
>  one of the simplest problems imaginable, namely counting.
>  Because almost everyone has an excellent grasp of counting, this chapt=
er
>  is able to delve into many important parallel-programming issues witho=
ut
> @@ -79,9 +79,9 @@ the distractions of more-typical computer-science pro=
blems.
>  My impression is that this chapter has seen the greatest use in
>  parallel-programming coursework.
> =20
> -Chapter~\ref{cha:Partitioning and Synchronization Design}
> +\cref{cha:Partitioning and Synchronization Design}
>  introduces a number of design-level methods of addressing the issues
> -identified in Chapter~\ref{chp:Counting}.
> +identified in \cref{chp:Counting}.
>  It turns out that it is important to address parallelism at
>  the design level when feasible:
>  To paraphrase \pplsur{Edsger W.}{Dijkstra}~\cite{Dijkstra:1968:LEG:362=
929.362947},
> @@ -90,40 +90,40 @@ suboptimal''~\cite{PaulEMcKenney2012HOTPARsuboptima=
l}.
> =20
>  The next three chapters examine three important approaches to
>  synchronization.
> -Chapter~\ref{chp:Locking} covers locking, which is still not only the
> +\cref{chp:Locking} covers locking, which is still not only the
>  workhorse of production-quality parallel programming, but is also wide=
ly
>  considered to be parallel programming's worst villain.
> -Chapter~\ref{chp:Data Ownership} gives a brief overview of data owners=
hip,
> +\cref{chp:Data Ownership} gives a brief overview of data ownership,
>  an often overlooked but remarkably pervasive and powerful approach.
> -Finally, Chapter~\ref{chp:Deferred Processing} introduces a number of
> +Finally, \cref{chp:Deferred Processing} introduces a number of
>  deferred-processing mechanisms, including reference counting,
>  hazard pointers, sequence locking, and RCU\@.
> =20
> -Chapter~\ref{chp:Data Structures} applies the lessons of previous
> +\cref{chp:Data Structures} applies the lessons of previous
>  chapters to hash tables, which are heavily used due
>  to their excellent partitionability, which (usually) leads to excellen=
t
>  performance and scalability.
> =20
>  As many have learned to their sorrow, parallel programming without
>  validation is a sure path to abject failure.
> -Chapter~\ref{chp:Validation} covers various forms of testing.
> +\cref{chp:Validation} covers various forms of testing.
>  It is of course impossible to test reliability into your program
> -after the fact, so Chapter~\ref{chp:Formal Verification}
> +after the fact, so \cref{chp:Formal Verification}
>  follows up with a brief overview of a couple of practical approaches t=
o
>  formal verification.
> =20
> -Chapter~\ref{chp:Putting It All Together}
> +\cref{chp:Putting It All Together}
>  contains a series of moderate-sized parallel programming problems.
>  The difficulty of these problems vary, but should be appropriate for
>  someone who has mastered the material in the previous chapters.
> =20
> -Chapter~\ref{sec:advsync:Advanced Synchronization}
> +\cref{sec:advsync:Advanced Synchronization}
>  looks at advanced synchronization methods, including
>  non-blocking synchronization and parallel real-time computing,
> -while Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}
> +while \cref{chp:Advanced Synchronization: Memory Ordering}
>  covers the advanced topic of memory ordering.
> -Chapter~\ref{chp:Ease of Use} follows up with some ease-of-use advice.=

> -Chapter~\ref{chp:Conflicting Visions of the Future}
> +\cref{chp:Ease of Use} follows up with some ease-of-use advice.
> +\cref{chp:Conflicting Visions of the Future}
>  looks at a few possible future directions, including
>  shared-memory parallel system design, software and hardware transactio=
nal
>  memory, and functional programming for parallelism.
> @@ -552,6 +552,6 @@ The style for this particular book is documented in=

> =20
>  As noted at the beginning of this section, I am this book's editor.
>  However, if you choose to contribute, it will be your book as well.
> -In that spirit, I offer you Chapter~\ref{chp:Introduction}, our introd=
uction.
> +In that spirit, I offer you \cref{chp:Introduction}, our introduction.=

> =20
>  \QuickQuizAnswersChp{qqzhowto}
>=20


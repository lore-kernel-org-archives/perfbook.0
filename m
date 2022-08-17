Return-Path: <SRS0=Pd2e=YV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=PC6jh3C2q/poeUrHL96X/hfy7VxODaJgTLgBs3JDe5E=;
        b=QXAXmSMcGq0B7iT6Uk5+sAKkx8Ghq60SCraUC2YknlupjmSutqtp8mWBhKUm+hFENU
         0+Qre/vGptmKSaFoMG6ySFlWoT+rpM9AItBZifZmW3ZPTOnXpO4kCHyLSDOUFe5DPHsH
         p8NXxXEEBXCxN0YeevuIuggVG4u0ucFi7CozWOpt8W4j7xN1TGjYjdBczQj2odvmALxw
         D4NPe+HfLNpZh5pdbgOa/kXPLs7pwyk+AZ/qsOqdGA7OkO4o+X37fCIYiN+Jef4UPqnV
         UiDVtsQBZH1WJQJGssAdg9UULhbdF4X/pjvpUV1JE2FI47Ft0ZyCreEASQPQgAIYgRLW
         bQTA==
Message-ID: <0dfcdb91-12d7-86f7-4c8d-26a101bec7b5@gmail.com>
Date: Thu, 18 Aug 2022 00:18:09 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v2] count: Switch from GCC to C11 thread-local storage
Content-Language: en-US
References: <20220817110049.182128-1-e2lahav@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220817110049.182128-1-e2lahav@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Elad Lahav <e2lahav@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Elad,

On Wed, 17 Aug 2022 07:00:50 -0400, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> ---

As there is no changelog here, let me ask a (maybe stupid) question.

What is your goal of diverting from GCC extensions and switching
to the C11 standard?

Do you want the codebase under CodeSamples/ to be strictly
conformant to C11 or later?

Runnig "make" under CodeSamples/count, with "-std=c11" appended
to GCC_ARGS, I get a lot of compile errors/warnings (with GCC 9.4.0
under Ubuntu 20.04), beginning with:

    cc -g -O2 -Wall -std=c11  -o count_atomic count_atomic.c -lpthread

    In file included from /usr/include/sched.h:34,

                     from /usr/include/pthread.h:22,

                     from ../api.h:159,

                     from count_atomic.c:22:

    /usr/include/time.h:113:5: error: unknown type name 'locale_t'

      113 |     locale_t __loc) __THROW;

          |     ^~~~~~~~


A workaround is to append "-D_GNU_SOURCE" to GCC_ARGS.  With that,
I get the next warning of:

    ../api.h:766:2: warning: implicit declaration of function 'typeof' [-Wimplicit-function-declaration]

  766 |  typeof(*ptr) _____actual = (o); \


Apparently, typeof() is another GCC extension.  __typeof__() might
be used instead, but it is not ISO C.

So what is you goal of these switches?

        Thanks, Akira

>  CodeSamples/count/count_end.c | 12 ++++++------
>  count/count.tex               | 20 ++++++++++++--------
>  2 files changed, 18 insertions(+), 14 deletions(-)
> 
[...]

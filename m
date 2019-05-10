Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-pf1-f176.google.com ([209.85.210.176]:44257 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbfEJP4m (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 10 May 2019 11:56:42 -0400
Received: by mail-pf1-f176.google.com with SMTP id g9so3438675pfo.11
        for <perfbook@vger.kernel.org>; Fri, 10 May 2019 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m0xmgExvHS8T3rjFgM3FqPZhozRgsnwKnK+SJKSIsHc=;
        b=b/nxHmsel3QzM2/B6O2mKgkKeK3rPqMNLF4vwhG4b2vmHmCbA7fWuScClUMe4Lotcb
         3QWWWOzz7LMTrkPUkT5tgoVqp4yrjZtjLxN/gQgKzDD2mIeqtHG/a2r5BmT1jVSw0bAi
         qAbWd721ypFbFjIbJgnpf235I2mg0Ur9iqr26TA0vn8Il6VBmLOuupvOBJOSNYQaEnHW
         DWzeBm1n6N8rSe43h5u92KhJywnwMbPDODHA49sdwKCibRvTlbysu1IPM9SUb15bIyKq
         5stCWBvnsaiJq3RDsw/K39CrzFEY+T3tbRj47awGW+UJiLU7STgKmL9k5p9eTZ5lhNnG
         fymQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: Single-threaded accesses and signal handlers
References: <CAJbg=FWSV6akb4g7Kt8-sNt-mnLUZ25MHZ=bPQuEfd6PEUY0NQ@mail.gmail.com>
Message-ID: <ecddd9c0-72b5-0b3d-a79c-f05029085658@gmail.com>
Date: Sat, 11 May 2019 00:56:33 +0900
MIME-Version: 1.0
In-Reply-To: <CAJbg=FWSV6akb4g7Kt8-sNt-mnLUZ25MHZ=bPQuEfd6PEUY0NQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

Hi Elad,

On Fri, 10 May 2019 07:35:02 -0400, Elad Lahav wrote:
> Hello,
> 
> In a few places in Chapter 4 it is mentioned that a certain access
> pattern is safe in a single-threaded program. 

"thread" in Section 4.3 does not directly match that of pthread.
You might have already noticed, Paul mostly does Linux kernel
programming and his choice of words can be incompatible with
your perspective.

>                                               In many (most?)
> Unix-like operating systems signal handlers in an otherwise
> single-threaded process execute in the context of that single thread.
> Nevertheless the signal handler represents a conceptually separate
> stream of execution that is subject to similar race conditions as
> those that occur in "true" multi-threaded programs. The situation is
> even worse with signal handlers as standard locks typically cannot be
> used to protect the access to shared data.
> It may be worthwhile to mention this pitfall.

FYI, locking and signal handlers are covered in Section 7.1.1.8.
I have no idea if discussion there can satisfy you, though.

> 
> Also, a small typo in "Shared-Variable Shenanigans":
> 
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1550,7 +1550,7 @@ Of course, where practical, the primitives described in
>  Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
>  or (especially)
>  Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}
> -should be instead be used to avoid data races, that is, to ensure
> +should instead be used to avoid data races, that is, to ensure
>  that if there are multiple concurrent accesses to a given
>  variable, all of those accesses are loads.
>

Nice catch! It would be more than welcome if you could contribute in
a properly formatted patch by using "git format-patch".

        Thanks, Akira 
 
> --Elad
> 


Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KDHFFo9+5CUafJE51pNiJHqd3ona2K4JnRdppO6iz6c=;
        b=jaGzDjVCtlPoVRSJBMjSU8QBw1+3ZeWOhm0W43ma7Wd6lDPcM2tzoy04838FA1opCA
         do1OcKgaPO6WMhoVE9h17eUkc0Regyb8pneCxjDqCWcnB1iYktgseiop+ZIVZxvwYFdi
         4faiFwMDgIuQf3rBxPLIxRfV1G2WCZRTfr7fQZXWRhqPiZgavCcFwFeD1ZsxcZt7Fqn0
         6tTglD9aNKuCzahg/ZFPNe4il9lf/hAVWGuJBK0mBMDp61R3hDs4lU5ku7kFkqyqWESA
         9HCLnVCUgLtcYjCcsLWOgpfvUC4Gv13VUz0YTMhySTcxDvmFQbpgL8zgZ7ss9NWJUjdc
         juig==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH -perfbook 0/5] ebook reader size support
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
 <20210325161652.GL2696@paulmck-ThinkPad-P72>
Message-ID: <eb5b9862-1fa3-93b4-1a2c-b287a16bdfbb@gmail.com>
Date: Fri, 26 Mar 2021 04:24:03 +0900
MIME-Version: 1.0
In-Reply-To: <20210325161652.GL2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 25 Mar 2021 09:16:52 -0700, Paul E. McKenney wrote:
> On Thu, Mar 25, 2021 at 07:49:44PM +0900, Akira Yokosawa wrote:
>> Hi Balbir and Paul,
>>
>> So, this is a revised patch set based on the RFC PATCH from
>> Balbir.
>>
>> Hearing no objection to the rename of "-er" to "-eb",
>> I did the rename in Patch 1/5 of Balbir's.
>> Patch 2/5 is an updated one I sent earlier, with additional 
>> float-barrier macro for ebooksize build and minor tweaks.
>> Note that the extra blank line at the bottom of \ebresizeverb
>> is now fixed.
>> Patch 3/5 is also an updated one I sent earlier.
>> Patch 4/5 shrinks floats in styleguide.
>> Patch 5/5 updates help text in Makefile to mention build targets
>> for ebooksize.  They are marked as (WIP) for the moment.
>>
>> This set can be applied to current master.
> 
> When I try "git am -s -3", I get this:
> 
> ------------------------------------------------------------------------
> 
> Applying: perfbook-lt: Add macro to shrink floats for ebook
> fatal: sha1 information is lacking or useless (perfbook-lt.tex).
> error: could not build fake ancestor
> Patch failed at 0001 perfbook-lt: Add macro to shrink floats for ebook
> The copy of the patch that failed is found in: .git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> ------------------------------------------------------------------------
> 
> The usual cause of this is when the series is on top of a few additional
> patches in your git archive.  If this is the case, then it is possible
> that you can rebase them without git complaining because git analyzes the
> intervening patches.  Lacking those intervening patches in my archive,
> git just complains at me.
> 
> If this is the case, could you please rebase this series onto master,
> then resend?  Alternatively, resend including the intervening patches,
> allowing me to do the rebase.
> 
> If there are no intervening patches in your archive, I have no idea what
> is happening.  ;-)

Strange...

I see the HEAD of master at the tag "Edition.2", whose commit id is
6932521bb9df ("future/htm: Remove redundant 'to' from 'WRT to' in section
headings").

My attempt to apply this series by "git am" is OK.

Do you have any commits not pushed yet?

If so, please try to apply this patch set on Edition.2?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>        Thanks, Akira
>>
>> --
>> Akira Yokosawa (4):
>>   perfbook-lt: Add macros to shrink floats for ebook
>>   cpu, toolsoftrade, count, rcuapi: Shrink floats for ebook reader
>>   styleguide: Adjust float size and add a floatbarrier for ebook-size
>>     build
>>   Makefile: Add info on ebooksize build in help and help-full
>>
>> Balbir Singh (1):
>>   perfbook/papersize: ebook reader size support
>>
>>  Makefile                           | 21 +++++++++-
>>  appendix/styleguide/styleguide.tex | 12 ++++++
>>  count/count.tex                    | 15 ++++++--
>>  cpu/overheads.tex                  |  2 +
>>  defer/rcuapi.tex                   | 12 +++++-
>>  perfbook-lt.tex                    | 62 ++++++++++++++++++++++++++----
>>  toolsoftrade/toolsoftrade.tex      |  2 +
>>  7 files changed, 111 insertions(+), 15 deletions(-)
>>
>> -- 
>> 2.17.1
>>
>>

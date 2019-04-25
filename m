Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36666 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfDYPip (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 25 Apr 2019 11:38:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id 85so45568pgc.3
        for <perfbook@vger.kernel.org>; Thu, 25 Apr 2019 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xfmg8h6ilQnoILXJA4y8EUV6nj54A4U+P4vgTchiCEo=;
        b=V9KFLj6rm/GNyyNdM5tZnRWKeZF2GK+YHTfn/+3d3BMYAA/E6fBJSNzTrik8dEQ/jf
         tp6OunzXdhjd4FBV54Q6C6CRJ4/TS88nWy1Cr/6zK+eyDub0yqWtgMYtuDwGoFBDvMaS
         jJtCCGpdki8X7lVJKnBiE7W6O5t13mYeJ4W2xWtuN8SN58QtAxk2/1xSqUMno1S4q0rY
         zrErkLBdYfFSVmSdka8h8b1IhtOkF+WfljBUfwim+eympdUUrJmg6yZVnJzhKO2fXbix
         6xOTKI3CGNKYbHrjAw19fP9EuFBG9kDZgxrx2jqu3OiI2yFDs2EDGuSBfTQ87v5Itl/K
         XrIQ==
Subject: Re: [PATCH v2 0/3] Toyrcu: replace plain accesses with READ_ONCE()
 and
References: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <95b306ce-9ddb-0ac5-ee5c-077cb4a9a27e@gmail.com>
Date: Fri, 26 Apr 2019 00:38:40 +0900
MIME-Version: 1.0
In-Reply-To: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

Hi Junchang,

On Thu, 25 Apr 2019 16:29:51 +0800, Junchang Wang wrote:
> Hi Paul and Akira,
> 
> This patch set replaces plain accesses and ACCESS_ONCE() with READ_ONCE()
> and WRITE_ONCE() in Toy RCU examples. I will send another patch updating
> tex file accordingly on top of this patch set.

As far as accesses to rcu_gp_ctr, this patch set looks good to me.

In updating toyrcu.tex file, I suggested to extract the snippets from
code under CodeSamples/defer, but some snippets in toyrcu.tex consist of
code from both .h and .c. Current scheme does not support such merging
of snippets from multiple source files.

Your option is to manually convert verbbox environment to Verbatim
environment. Sorry I suggested infeasible extractions the other day.
rcu_qs.c and rcu_qs.h are in separate snippets, and they can be
extracted by fcvextract.pl. In this case, commit 4a41491166cd
("defer/hazptr: Extract snippet from hazptr.c") should be a good example,
especially the "gobbleblank=yes" option.

If you have any question, feel free to ask me. I'm looking forward to
seeing your update.

Paul, in the sources Junchang has touched, per-thread variable
"rcu_reader_gp" is updated by its owner, but is read accessed from
for_each_thread loops in updater side. So I think accesses to each of
them need to be annotated by WRITE_ONCE (in owner) and READ_ONCE (in updater).
I looked at only the diffs in the 1st patch set and didn't notice the raciness
of them.

Macros for accessing per-thread variables are expanded to array references,
and there are "barrier()"s in these loops.
So I think there is little chance those accesses would be optimized by
currently available compilers.

Do you see the need to annotate the accesses to per-thread variable?

        Thanks, Akira 

> 
> --
> Junchang Wang (3):
>   rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
>   rcu_nest: Use READ_ONCE() and WRITE_ONCE() for shared variable
>     rcu_gp_ctr
>   rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable
>     rcu_gp_ctr
> 
>  CodeSamples/defer/rcu.c      | 2 +-
>  CodeSamples/defer/rcu.h      | 4 ++--
>  CodeSamples/defer/rcu_nest.c | 2 +-
>  CodeSamples/defer/rcu_nest.h | 2 +-
>  CodeSamples/defer/rcu_qs.c   | 2 +-
>  CodeSamples/defer/rcu_qs.h   | 4 ++--
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 


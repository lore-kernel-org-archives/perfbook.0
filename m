Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EzECkCMiiouJDHXSVmCY4h9VIMi7aSrRWuYRVZJSlPw=;
        b=ixO0Dmx5fp7X/v2mgMHMWeA3q+BS6fjwSoRNyyB4TIN4nsdhLmzoOaE1f62vv2lOFP
         ljEj2/nUBRQB2Z/oz50m3G7yR/Scg8uvpwxDTygRfe7ENoRwQv04aMFI/g7HVRWrgjqZ
         9LUueArMmK73/102KXK2i/6msjiYpFQPg5BnpUP41wzeaMd3bjHIeLOvqpUDhjCPnCQU
         G6utzCVRjC7e1bqR3NpOeXIBz7YKqOrnSXOY6GNyJ+m/Oe5gK64IFoINIka065Jjxp7g
         NVuOgbwSTuOkdnvpDuQelaoT2FpuRUySeHfBk6xO6GaqV6c8PyYI+ryH+iYWH2dy6Vu1
         KqgA==
Subject: Re: [PATCH v3 0/2] Toyrcu: replace plain accesses with READ_ONCE()
References: <1556548724-17844-1-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <899d284e-bace-d53a-0e17-5f841885943e@gmail.com>
Date: Tue, 30 Apr 2019 00:38:43 +0900
MIME-Version: 1.0
In-Reply-To: <1556548724-17844-1-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 29 Apr 2019 22:38:42 +0800, Junchang Wang wrote:
> Hi list,
> 
> Variable rcu_gp_ctr is accessed concurrently by the updater and readers,
> and hence should be protected by READ_ONCE() and WRITE_ONCE(). This patch
> set updates rcu and rcu_qs.
> 
> The tex file is updated accordingly. And a new scheme, which is suggested
> by Akira and can extract code snippets from the source code, has been
> applied.
> 
> Please note that rcu_nest also needs to be updated. I will first make sure
> that I'm fully understand how it works, and then submit a patch for it.
> 

Hi Junchang,

Thanks for doing all this.
One thing I'd like you to be aware of is that when a patch is updated heavily
like this, Reviewed-by: tags should be dropped.
I'll review this patch set in a few days. Please give me a little while.

        Thanks, Akira

> --
> Junchang Wang (2):
>   rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
>   rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable
>     rcu_gp_ctr
> 
>  CodeSamples/defer/rcu.c    |  30 ++++---
>  CodeSamples/defer/rcu.h    |  21 +++--
>  CodeSamples/defer/rcu_qs.c |  29 ++++---
>  CodeSamples/defer/rcu_qs.h |  42 ++++-----
>  appendix/toyrcu/toyrcu.tex | 207 +++++++++++++++++----------------------------
>  5 files changed, 146 insertions(+), 183 deletions(-)
> 


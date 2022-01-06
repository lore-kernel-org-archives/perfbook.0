Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vWH001qU/H277WGum85dwpb/Hs/rOp+PpcH4sqKjGKg=;
        b=a50EIKHFQHIGeQDeuwpm27x+JQHTBrw72hQ13GcIDZcjozgJcUrGsoT2WisvKGDtiy
         u9hfFcGS4s+ZAnwvLIMHWds9+Mb2INll1tWF1X+JyEeSLSqKX0DftREwivn51zLA40gf
         2U173qfcYetqctgs13UzE4Ro2GSw/8udDNEK4VrX0Hi9BpjVP1JVSMJa9IRFQJvFFVZt
         zqm5BDDZdITWCWQE05yPf4C6kr6YNpljfHGbPT/zm7kKcCQcMtDzgqlidqjRQET1zHUN
         QbV0LNsuvwMqm1fN1M0gRPi/HHf1rvhu6tS5+UVMZK3c/eySq2FwGt6jTjkhErDxOtBR
         n+tQ==
Subject: Re: [PATCH -perfbook 00/10] Index and acronym updates
References: <c2d4c1fc-3865-dc35-d19d-cc563689b6c2@qa2.so-net.ne.jp>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9a29944c-ab11-41f0-6796-f335fc36a47b@gmail.com>
Date: Thu, 6 Jan 2022 16:26:39 +0900
MIME-Version: 1.0
In-Reply-To: <c2d4c1fc-3865-dc35-d19d-cc563689b6c2@qa2.so-net.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akys@qa2.so-net.ne.jp>
List-ID: <perfbook.vger.kernel.org>

On Thu, 6 Jan 2022 16:24:10 +0900, Akira Yokosawa wrote:
> Subject: [PATCH -perfbook 00/10] Index and acronym updates
> 
> Hi Paul,
> 
> This is another round of *never-ending* indexing updates.
> 

Sorry, I sent this one from a different account. Please ignore!

Will resend soon.

--
Akira

> Patches 1/10--3/10 add indexing tags to terms recently added in Glossary.
> Patch 4/10 adds API indexing tags in rcuapi.
> Patch 5/10 fixes a typo found while working on Patch 4/10.
> 
> Patch 6/10 adds indexing tags for userspace-RCU APIs in datastruct.
> Those APIs are also used in code snippets of other chapters, but are
> seldom mentioned from the text in later chapters/sections.
> 
> Patches 7/10 and 8/10 add API indexing tags in count and locking.
> Patch 9/10 defines acronym of QSBR and adds tags for QSBR and EBR.
> 
> Patch 10/10 defines acronym of RAII and adds its tags.  The "WIP" in
> the title indicates changes in the appearance of first-time form from
> quoted string to emphasized modifier form.  Please keep it with the change
> log amended if the new appearance looks good/acceptable to you.
> 
>         Thanks, Akira
> --
> Akira Yokosawa (10):
>   index: Add tags for 'reference count'
>   index: Add tags for 'existence guarantee'
>   index: Add tags for 'type-safe memory'
>   defer/rcuapi: Add index tags for RCU APIs
>   defer/rcuapi: Fix typo 'get_nulls_values()'
>   datastruct: Add index tags for userspace-RCU APIs
>   count: Add index tags to APIs
>   locking: Add index tags to APIs
>   treewide: Add acronym tags for QSBR and EBR
>   WIP locking: Add acronym tag for RAII
> 
>  SMPdesign/SMPdesign.tex       |   4 +-
>  appendix/toyrcu/toyrcu.tex    |   3 +-
>  count/count.tex               |  16 ++---
>  datastruct/datastruct.tex     |  14 ++--
>  defer/rcuapi.tex              | 120 +++++++++++++++++-----------------
>  defer/rcuintro.tex            |   3 +-
>  defer/rcurelated.tex          |   4 +-
>  defer/rcuusage.tex            |  11 ++--
>  defer/refcnt.tex              |   3 +-
>  defer/whichtochoose.tex       |   9 ++-
>  future/tm.tex                 |   3 +-
>  glsdict.tex                   |   2 +
>  locking/locking-existence.tex |   2 +-
>  locking/locking.tex           |  20 +++---
>  memorder/memorder.tex         |   2 +-
>  together/applyrcu.tex         |   2 +-
>  together/refcnt.tex           |   8 ++-
>  toolsoftrade/toolsoftrade.tex |   4 +-
>  18 files changed, 118 insertions(+), 112 deletions(-)
> 
> 
> base-commit: 3cc2d7eede268930304b35fdce6121e18b2ceef6
> 

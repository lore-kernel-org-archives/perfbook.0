Return-Path: <SRS0=4SL/=IX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hve3O5uTTOmylo53PTrwoQGT64ulsDGMiT8NrtbWKDs=;
        b=hDTG3n/ELDDC81/B1fhFmFen6bkfJ21F6H2eFV0Ic0OMubM7E8INWL6AIGO15iSZmP
         8vTqJXA7FGi3BydOimlqyctFUGbZu6Wxv4j5Q6d7A69sc/QwrHeGQcitQf+9/VpTPCjP
         u6vmClQBXSIlxCnRqvzEl5Da2DRmKOXsHt6qnvdQit0G1944S0f9r76vxify6s10H2Ey
         IjcQsHLQW/meUxn7MxRFeEOVhE0i4EvKVvfrX/w1vfEDqVfCrntspKrsUsGRicHyuXlD
         vSedhvA4gfQwuXyMFBOV+IkV05Hl1WS617wRmlFnlzaOw1ToUhvvSPWOUqEc5j8DBHGZ
         ggtQ==
Subject: Re: [PATCH -perfbook 0/5] ebook reader size support
References: <20210323010153.GH77072@balbir-desktop>
 <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7ba92b12-2d4d-5b92-599a-1ad675b387e0@gmail.com>
Date: Thu, 25 Mar 2021 20:41:21 +0900
MIME-Version: 1.0
In-Reply-To: <64419413-f54f-a737-bcae-e03b8ecaf606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 25 Mar 2021 19:49:44 +0900, Akira Yokosawa wrote:
> Hi Balbir and Paul,
> 
> So, this is a revised patch set based on the RFC PATCH from
> Balbir.
> 
> Hearing no objection to the rename of "-er" to "-eb",
> I did the rename in Patch 1/5 of Balbir's.
> Patch 2/5 is an updated one I sent earlier, with additional 
> float-barrier macro for ebooksize build and minor tweaks.
> Note that the extra blank line at the bottom of \ebresizeverb
> is now fixed.
> Patch 3/5 is also an updated one I sent earlier.
> Patch 4/5 shrinks floats in styleguide.
> Patch 5/5 updates help text in Makefile to mention build targets
> for ebooksize.  They are marked as (WIP) for the moment.
> 
> This set can be applied to current master.

Paul, as you might have already know, the "(WIP)" means expected
build failure due to a lot of

   LaTeX Warning: Float too large for page by xxx pt on input line yyy.

warning messages.

For the moment, please ignore the make error and have a look
at the generated PDF.  Chapters 1 through 5 and the style
guide should be acceptable, give or take the tiny characters
in some of the shrunk tables/listings.

        Thanks, Akira
> 
>        Thanks, Akira
> 
> --
> Akira Yokosawa (4):
>   perfbook-lt: Add macros to shrink floats for ebook
>   cpu, toolsoftrade, count, rcuapi: Shrink floats for ebook reader
>   styleguide: Adjust float size and add a floatbarrier for ebook-size
>     build
>   Makefile: Add info on ebooksize build in help and help-full
> 
> Balbir Singh (1):
>   perfbook/papersize: ebook reader size support
> 
>  Makefile                           | 21 +++++++++-
>  appendix/styleguide/styleguide.tex | 12 ++++++
>  count/count.tex                    | 15 ++++++--
>  cpu/overheads.tex                  |  2 +
>  defer/rcuapi.tex                   | 12 +++++-
>  perfbook-lt.tex                    | 62 ++++++++++++++++++++++++++----
>  toolsoftrade/toolsoftrade.tex      |  2 +
>  7 files changed, 111 insertions(+), 15 deletions(-)
> 

Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=EsUZzSGnd07pTGwjDPfyMgIO9hBjxgGDv2Umykrc0EU=;
 b=l34A19s7PPY/Q4CgJSwtIB/jlvgdY0oiDv2cEMvkrL0ONzsgFLh+vMO+nQQmZVlTZL
 15+UPF0E4hXr9J8b1ZxfDG4lygW5c3OzDpa7l+UPca3y2WaGkPkSPDDi01O0Hgm6Z/0D
 ESxnsQLixGJOA1DFvUBHAalsJN41eL/83wDYDCETNrIowpD2TCputIPp8tcPca2QxCFx
 8KQAP4lpWBrCTgpAjz8TTYSW5fTrQue1XcGHEUWKSJQbif6QjcM/BSvynbNfzR5cu3h1
 3D4yl0aQHPz5FBguYPYrmWhNH+F9hb8JzYjDlUV5hRhNvbkp8EyOwFfCWXNBNH/o7Ll1
 ZBEg==
Subject: RFT withdrawn (was Re: [RFT PATCH 0/5] Another round of build script
 tweaks)
References: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dfd9ba68-6653-d26e-65ed-01d098327417@gmail.com>
Date: Tue, 3 May 2016 21:55:51 +0900
MIME-Version: 1.0
In-Reply-To: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/03 7:47, Akira Yokosawa wrote:
>>From 4ce174f3c72367fed945fb4448e294d205b8d88a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Tue, 3 May 2016 00:18:53 +0900
> Subject: [RFT PATCH 0/5]  Another round of build script tweaks
> 
> This series restructures build scripts rather radically. 
> My initial feeling was that [5/5] would be the most controversial,
> and placed at the end of the series.
> But in hindsight, [1/5] seems to be the most controversial one.
> 
> Anyway, I'd like people to try them and give feedback.
> 
> In commit 4038e781ed56 ("Improve behavior of build scripts"),
> I caused some regressions.  They were fixed soon after,
> but I think changes in build scripts need to be heavily tested
> before being pulled in.
> 
> Any feedback is welcome. Thanks.
> 
> Akira Yokosawa (5):
>   Further improvement of build scripts
>   Add font installation check
>   Add short name targets in Makefile
>   Add explanation of short name target in FAQ.txt
>   Make default target of Makefile overridable
> 
>  .gitignore            |   10 +-
>  FAQ.txt               |   23 +
>  Makefile              |  322 +--
>  contrib.tex           |   60 -
>  count/sig-theft.dot   |   19 +-
>  count/sig-theft.eps   |  457 ---
>  origpub.tex           |    8 -
>  qqz.tex               | 7707 -------------------------------------------------
>  utilities/eps2pdf.sh  |   12 +
>  utilities/runlatex.sh |    9 +
>  10 files changed, 181 insertions(+), 8446 deletions(-)
>  delete mode 100644 contrib.tex
>  delete mode 100644 count/sig-theft.eps
>  delete mode 100644 origpub.tex
>  delete mode 100644 qqz.tex
> 

As I reported in another mail, this series causes painful side-effects.
Please refrain from trying this series.

I'll resubmit v2 of this series soon.

Sorry for the trouble.

                                                  Thanks, Akira


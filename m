Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36155 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbfIRWzA (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 18 Sep 2019 18:55:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id m29so708913pgc.3
        for <perfbook@vger.kernel.org>; Wed, 18 Sep 2019 15:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0EvEQ5AQY4MgFnPHonO58QqQdAaHkosMLeO9MtoXl/8=;
        b=Zkw+y+YXBFTtW5KD1wmSQIOmcHZOWoh0DFLQ98Bi+6n/Kmi5JzghHIIKURPNn5UTrn
         ygBaOSv86K+tmc9O/GZkQS77yfuuD4LRv+Q6SIK/DwfgE2HMD3FNxP+Q7+prH2Ksoa0Q
         2FXvvyZBXURbIIMJsOX8J0krJeOHu46kMDUGbe+8Bzp9u8Y0onLdHdMtPSIF3t2GwOVi
         K83tqS1Kkbt0H1yrd1htsqljIMDIRgzjbXMmqJQCUY5jMhtfkMaOSzHd0NUWLqUkWK3+
         Ns7qDrz2QiSSzYjvWOKg7rc5inTmT0dg86KJ3BbnPwMs9XgPlXbbHLsv6DVDsyR5gmZy
         Ihbg==
Subject: Re: [EXP PATCH] Make hyperlinks colorful and browsable in PDF viewer
References: <aeaa1b9d-1917-a177-3396-da8dd736889c@gmail.com>
 <36156427-7c2b-130b-41b6-a18b425eff2e@gmail.com>
 <CAKTCnz=8penAT4UJUFvxjx8sXFHKAdP2oCuQDX2H2oo6o5mQ0g@mail.gmail.com>
 <a161e1ba-37c0-4edf-da13-463ad2f3eb6a@gmail.com>
 <c8228db6-1ebd-2b77-2b7c-bd100068d367@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5684b902-5c1a-5cf2-bda3-7c91037b9730@gmail.com>
Date: Thu, 19 Sep 2019 07:54:56 +0900
MIME-Version: 1.0
In-Reply-To: <c8228db6-1ebd-2b77-2b7c-bd100068d367@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On 2019/09/19 7:52, Akira Yokosawa wrote:
> From: Balbir Singh <bsingharora@gmail.com>
> 
> Without these changes the PDF does not provide a browsable TOC
> to choose for navigation, also add a bit of color to the links
> to make them screen friendly.
> 
> [akiyks: Split from patch [1].
>     As 2c layouts are supposed to be for printing, enable coloring
>     of hyperlinks only in 1c layout. To do this, add a boolean
>     variable "colorlinks" and set it true for 1c layout. This would
>     make it easy to change the condition to enable "colorlinks".
> 
>     Select "DarkBlue" via xcolor's "svgnames" option as it looks
>     less distracting than the pure "blue".
> 
>     Redundant framing of links in bibliography is disabled when
>     "colorlinks" is effective.
> 
>     Also make the page numbers in TOC hyperlinks as well.
> 
>     [1]: https://www.spinics.net/lists/perfbook/msg02350.html
> ]
> 
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul and Balbir,
> 
> This is an experimental patch.
> Does the links in "DarkBlue" acceptable (in 1c layout) to you?

Oops, obviously I meant "Do the links ...".

> Any suggestion of color choice is welcome!
> 
>         Thanks, Akira
> --
[...]

Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=DNz3ukIaZ4j2EjOH6EpMYjw5ow7449XsTXubAV40u+M=;
 b=IRT15TTl9TcjZLBLl7a/7m7pfdl0ApGXNT+iKwtLpbtJWxqkm8oAAHQTQr6dtei7c9
 re3V7u2C36/e5FGTMCMzDfFtGz/hrDchkRWEPiEP9uiyLnURoB/gSqPHkkNOWVjbe7Ek
 Z/DLXIdXTt3WtKXbmxbb4MEJgPCgHiB+gH/I2sGB5q0Ad38ybFBNK+m7qZgdIfUnrQd/
 qZF3e+fW3XkevcCfEqIO9p7yV4a9dOxtFev7VNpfJpYWJfzdnZsOu5783pV4eMFSLlwk
 jD3PwQz5Tii2SzS9AHwTu7/W5bDsfi1rqBzE887G20mi59QBOWR7WE2r39zkY6PiiW1r
 bu5A==
Subject: Re: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
References: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <017bdee4-c318-f7f5-95bf-b213b4df86e5@gmail.com>
Date: Thu, 8 Sep 2016 00:58:53 +0900
MIME-Version: 1.0
In-Reply-To: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/09/08 0:47, Akira Yokosawa wrote:
>>From 480c37c4749ae4957791636e84e77566265613c2 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 8 Sep 2016 00:20:29 +0900
> Subject: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
> 
> This is a trial commit to avoid the side-effect of the "verbbox"
> environment, i.e., when it is used just after a section heading,
> the following paragraph loses implicit non-indentation.
> 
> This commit moves such a "verbbox" environment *before* the section
> heading.
> 
> There are also cases where two "verbbox" environments are placed just
> after section headings. To accommodate such cases, one of such
> "verbbox" need to be replaced with "myverbbox" environment to give
> another temporary verbatimbox content holder.
> 
> This commit includes an example of such a case.
> 
> Note that the "myverbbox" environment is provided in recent versions
> of the "verbatimbox" package, namely after v3.0.
> 
> If you have older versions of "verbatimbox" package, you need to
> update. Also the newer one requires the "readarray" package.
> 
> Please make sure you have those required packages.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  defer/toyrcu.tex | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 

Hi Paul,

So, this is what occurred to me.
The main idea is to move "verbbox" environment before the section heading.
This patch contains only a small samples.
Does this level of modification acceptable in your viewpoint?

One concern is the requirement of fairly new "verbatimbox" environment.
On Ubuntu 12.04, the one installed in texlive is too old.
On Ubuntu 14.04 and 16.04, it contains newer versions.

                                         Thanks, Akira



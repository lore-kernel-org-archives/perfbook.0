Return-Path: <SRS0=Uwbt=SY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KwVxdi/NE/DCVLCG8O75YGoyCUDc0ZQSK+Uo+yuYcjU=;
        b=eDlTiILKQ+13kh0o3OjAdGlHkWE99R6TrszAPQveDDnlpAX0ur5QpXwkbqiLptpxY4
         VW0KiGFwE5KPP5/qQahmnp/nUxeshfM7nG+wljIiXc0JodiOGT8lXDxU1MFTs3LgSSVU
         P5m4K76R4wb1QvQAqm8YbMZY7KdVAkkoiGU0SWkLlYBa42enuqpeSS8bFFVzgXu0O5ts
         1EaHSURyZRWMGHfpTYw/VWctCOmfSQRncTHil6ScnWoRxuijfG20RpBdC3a+SDh1PmWc
         IQsJ1BCl3/n/zkopWfXZ2wotaR64tIBlqO89hLZY1+nCjqLR/11ecP+5yGBml12cwoOM
         uCLw==
Message-ID: <3224bc4a-39f0-184d-dd89-aca998a2383d@gmail.com>
Date: Thu, 10 Feb 2022 00:17:24 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 3/3] cleverefcheck.pl: Add patterns to catch QQz
 positioning issues
Content-Language: en-US
References: <b9607a1e-7ab2-62fb-578e-d9dec3547905@gmail.com>
 <3754e966-dcae-bc66-1dfe-cc5dc4718bed@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <3754e966-dcae-bc66-1dfe-cc5dc4718bed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 10 Feb 2022 00:12:23 +0900,
Akira Yokosawa wrote:
> Add patterns in cleverefcheck.pl to catch:
> 
>   - A plain QQz or grouped QQzs at the beginning of a section
>   - Consecutive QQzs not properly grouped
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Paul,

You can see how the added pattern works by applying only 3/3
on current master e4815ca92805 ("memorder: Fix typos"), and
run "make punctcheck".

It will complain QQzs Patches 1/3 and 2/3 fix.

        Thanks, Akira

> ---
>  utilities/cleverefcheck.pl | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
> index 6e9a59e8..d92de5ac 100755
> --- a/utilities/cleverefcheck.pl
> +++ b/utilities/cleverefcheck.pl
[...]


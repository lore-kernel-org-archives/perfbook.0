Return-Path: <SRS0=fRoa=J5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I/g6QYrUnJHEvvsY54c9eehFJkTLZpYtEs9veorqzO0=;
        b=lUaidcKYYrFPFQKVofj4Wq3BY1H7Js+lNxTH/I0lWSOsyvY/bQFSMhRs9Qy6NJC+zS
         b87K8f/65REaq6LSqJB49pIFTupIx7PaxTQ/FhYQuw9GHXwTQ/Xwc8G76Qyb5zF+W4L0
         uO5Ld1ERBHxY2qvb2x4LBenm3c111ADRIaitsZgsPLhbkPBBNfcZK50L/XvThcEc4bmL
         Ua3rT7Ey5sLQgCFEOiuwgk2Q2kmmxvkZ1+5KO6Box4qfaQbnCsPAw4uVtIR/p0xZkvQ+
         iBtoW5habXwyakksjKxnSykNu4Oth8UAk9cI0eoUmrh9rupX7Mi6h+SlXn1I7MhBzk2G
         pHOA==
Subject: Re: [PATCH -perfbook] utilities/autodate.sh: Fix potential hung-up on
 missing tcolorbox
References: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0b71604e-5b51-c53a-57ce-d97a7dbaf620@gmail.com>
Date: Sun, 2 May 2021 20:59:43 +0900
MIME-Version: 1.0
In-Reply-To: <ad5501f7-e63c-1cc2-0e49-c93109ec75d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 2 May 2021 20:40:42 +0900, Akira Yokosawa wrote:
> "kpsewhich tcolorbox.sty" can be empty if tcolorbox is not
> available.
> 
> If this is the case, "grep" in `grep ProvidePackage | sed ...`
> will wait forever.
> 
> Add an empty check in front of "grep" with exit code of 1.

Paul,

Please ignore this patch.
I'll respin soon.

Sorry for the noise.

-- Akira


> 
> Fixes: b2f19231bcc5 ("utilities/autodate.sh: Make newer tcolorbox behave as before")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  utilities/autodate.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index 7bd7cbb8..2b9c1117 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -97,6 +97,13 @@ env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
>  
>  # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
>  tcolorbox_sty=`kpsewhich tcolorbox.sty`
> +
> +if [ "$tcolorbox_sty" == "" ]
> +then
> +	echo "Error: package 'tcolorbox' not found. See See #9 in FAQ-BUILD.txt" >&2
> +	exit 1
> +fi
> +
>  tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
>  tcbold=4.39
>  env printf '%% tcolorbox version: %s\n' $tcbversion
> 

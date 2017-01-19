Return-Path: <twoerner@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KsJqc4vRKv/5x5zBJm4qj2FsKfeiNSxb61+/cIrxkgY=;
 b=Pn9Uga5xQJwazQvt4mOUNP7IWOsAfFACq9pVECK8Nkab7sx6ZD7ip0jv7Zm2S9DHNo
 be01B5Wx49AkNK9TnxhHa9NwwxZ5hFXwiwZ8mUnIzkB3anUd7QFUAUtLFQLrDVWT80t8
 mXtJiiPY8iUzisDtEoPUhVguLBoXwilgAjwZCbTbPKIfAaNoP+dGYksZEsL5bZuxsecV
 G1zWHjI4QodFyTQsUBk48nAMZ0EVszn71E3rCZnnFJJ5rBgb/N7adw/1UMfTL7xwLMOZ
 NEpRrOEsA38vGWeeAC2zX7f+tEEK+dNuwYsIzvZszX88mWaqiZDoD3Fma8R7+d/ZWTi5
 AsyQ==
Date: Wed, 18 Jan 2017 21:33:17 -0500
From: Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH] autodate.sh: Use printf instead of echo
Message-ID: <20170119023317.GA15981@linux-uys3>
References: <20170116234125.28692-1-twoerner@gmail.com>
 <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
 <898ffe7c-cc25-773d-28a1-ff9c7f9c97e0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <898ffe7c-cc25-773d-28a1-ff9c7f9c97e0@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue 2017-01-17 @ 08:33:10 PM, Akira Yokosawa wrote:
> From bcd083c6be7cd9c69d1e05d19d732c32147bfd9a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 17 Jan 2017 20:04:54 +0900
> Subject: [PATCH] autodate.sh: Use printf instead of echo
> 
> Using "echo" command to generate output containing "\" characters
> caused a build error depending on the variant of "sh".
> For portability, we should use "printf" via "env" command.
> 
> Fixes: 878bf8160a5c
> Reported-by: Trevor Woerner <twoerner@gmail.com>
Tested-by: Trevor Woerner <twoerner@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  utilities/autodate.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index 6df8f99..a56bc70 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -35,7 +35,7 @@ else
>  	gitstatus=`git status --porcelain | wc -l`
>  	if [ $gitstatus != "0" ]
>  	then
> -		modified=" (m)"
> +		modified="(m)"
>  	else
>  		modified=""
>  	fi
> @@ -44,5 +44,5 @@ month=`date --date="$date_str" +%B`
>  year=`date --date="$date_str" +%Y`
>  day=`date --date="$date_str" +%e`
>  
> -echo "\\date{$month $day, $year$modified}"
> -echo "\\\newcommand{\\\commityear}{$year}"
> +env printf "\\date{%s %s, %s %s}\n" $month $day $year $modified
> +env printf "\\\newcommand{\\\commityear}{%s}\n" $year
> -- 
> 2.7.4
> 
> 


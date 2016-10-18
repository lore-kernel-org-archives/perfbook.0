Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=CcnUfsaFmTbsVovuMCxhykJZjOs6Yy0atr67Tv6m+jc=;
 b=mNDU5cEEfO8Tncp3+t5Kb+jOziSnRA4+LnYi4u3dFN7jgJOfKWnrClqDoEnCQbpUwi
 DYGFLcHYhIGJ35+68z9QS+5jbsqTAvAmTTkzv8avdWq/a7d0Xu60puE2SYdo0BdMP+z6
 H2nP9c6aa2u9lY9eSyFomhrkOgXOCh+ezJeKPX2ISb6Djjga3mGSAqupW63eJJOnZTPW
 mI8EjXIjl4B2/hgt0IDHx/LL41iByVqW9UmGiWJPii6LyZExZrN8DtWgHmqOWuIYCiLP
 5OytUBg5krV9R+liXmvV/aqw8+tmKh7Pgga7TQRNZKNtpyz6qwXQp95X78OLjWqPED+F
 Ty1w==
Subject: Re: [PATCH 0/6] Add targets for alternative fonts
References: <9229c60d-0468-7632-e59e-3921f0e46f54@gmail.com>
 <8b645c3e-ff44-de18-1ae8-c985b1b4cea3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2dbdabb8-3d52-9de1-5f67-d7b6462be19b@gmail.com>
Date: Wed, 19 Oct 2016 07:15:18 +0900
MIME-Version: 1.0
In-Reply-To: <8b645c3e-ff44-de18-1ae8-c985b1b4cea3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/10/19 6:59, Akira Yokosawa wrote:
>>From 0cfe68cfd9e7c5413c26f25408ea3cb78f1a334c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 9 Oct 2016 17:59:03 +0900
> Subject: [PATCH 1/6] Separate font package declarations
> 
> This is a preparation of font-choice tweaks to follow.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  perfbook.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/perfbook.tex b/perfbook.tex
> index 66c93fe..87d5b53 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -5,7 +5,9 @@
>  % A more pleasant font
>  \usepackage[T1]{fontenc} % use postscript type 1 fonts
>  \usepackage{textcomp} % use symbols in TS1 encoding
> -\usepackage{mathptmx,helvet,courier} % use nice, standard fonts for roman, sans and monospace respectively
> +\usepackage{mathptmx} % use nice, standard fonts for roman,
> +\usepackage{helvet}   % sans serif,
> +\usepackage{courier}  % and monospace respectively
>  
>  % Improves the text layout
>  \usepackage{microtype}
> 

Sorry, I failed to put a correct subject to this mail.
The one in the mail body is what was intended.

                                            Thanks, Akira


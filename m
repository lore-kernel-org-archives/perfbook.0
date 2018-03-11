Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tAbtm87M3Tc//TY7x9u+4BuLkVq75T8xEueAeHan5lw=;
 b=fJkf4yNGiLD9zZPLRLVx3UMvfpJm7y2bt2PL2mBpWhHKKF1vOjJstRyw6KZmHDavBR
 kN06zqSMrdzczEy93j21+LlNEpj7/TBN154sKvOpP1AUSUHOZ94me9SeYpstRaVDLeD2
 ffi3NZsRI7rB9uEIMGuYxW2B/uf4tA+GUfW+3Z7iip1UN51gvmMlqez4rs2mB0Ugdb2s
 WDyZkmRVsYOd0gH0dFMdL2EEBtiTPUu9+V9y82xP4epmnHmG3qo4CEiyZtzbwPfn7K0o
 nwPjlmCClW1ZxJ3RbX2xB6QDAIyS3pkVPVHToHMt+0GZ9D395fBhnEN/qN42+8dm9FlL
 gY0g==
Subject: Re: [PATCH] Add poor person's slanted shape for 'newtxtext' font
References: <bfc8d604-9405-2f70-93e0-2b5db0335e71@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bcb7cf66-dcf5-ac42-33a4-c8ad7f1e43ae@gmail.com>
Date: Sun, 11 Mar 2018 10:40:36 +0900
MIME-Version: 1.0
In-Reply-To: <bfc8d604-9405-2f70-93e0-2b5db0335e71@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/03/11 8:59, Akira Yokosawa wrote:
> From 9a2d254007e243e39ec9ee13319f1d25d882fea1 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 11 Mar 2018 07:49:24 +0900
> Subject: [PATCH] Add poor person's slanted shape for 'newtxtext' font
> 
> The "newtx" font package switched to TeX Gyre Termes fonts in
> version 1.4 (released in TeX Live 2014). It lacks slanted shape.
> 
> In perfbook, slanted shape is not used in LaTeX sources at the
> moment, but is used in page headers generated in the "book" document
> style.
> 
> The switch of Times Roman clone font to "newtxtext" font made in
> commit b4ad25eae241 ("future/QC: Use upright glyph for math constant
> and descriptive suffix") had a side-effect of page headers to
> be rendered in italic font when TeX Live 2014 or later is used.
> Most notably, chapter/section numbers in page headers are rendered
> upright.
> 
> This commit adds poor person's slanted shapes for roman fonts
> as suggested at https://tex.stackexchange.com/questions/247539/.
> 
> This change should not have visual difference on TeX Live 2013.
> 
> Fixes: b4ad25eae241 ("future/QC: Use upright glyph for math constant and descriptive suffix")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Paul, please ignore this patch.
I've just observed a build error on TeX Live 2017 after this change.

Sorry for the noise.

        Thanks, Akira
> ---
>  perfbook.tex | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/perfbook.tex b/perfbook.tex
> index efb6750..ce0c3a0 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -12,6 +12,12 @@
>  \renewcommand*\ttdefault{lmtt}
>  %msfontstub
>  
> +% Poor person's slanted shape for roman --- newtxtext lacks slanted shape
> +\AtBeginDocument{%
> +  \DeclareFontShape{\encodingdefault}{\rmdefault}{m}{sl}{<-> ptmro7t}{}%
> +  \DeclareFontShape{\encodingdefault}{\rmdefault}{b}{sl}{<-> ptmbo7t}{}%
> +  \DeclareFontShape{\encodingdefault}{\rmdefault}{bx}{sl}{<->ssub * ptm/b/sl}{}%
> +}
>  % Improves the text layout
>  \usepackage{microtype}
>  \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
> 


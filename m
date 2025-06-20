Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDF830E85F
	for <perfbook@vger.kernel.org>; Fri, 20 Jun 2025 04:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750394689; cv=none; b=NRpJFiq3ib/fJ9BQevJh81MjtoBEAlMpzz2qAUzjo+odga1XkQon40jCYMM46M89CYRY1o9dp3H2dF2WXiLN7CaGBE/ikeqTqaJ95aStOfRpf1ujpzKqLgTk8XoLc3/o/kuueJ4NSfJNz5sKQFnukkf1iUo9VXVBTf0V2CB+1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750394689; c=relaxed/simple;
	bh=ygMCD3j2LG09u8S/z1LtE3fWG12zY3kPSTvrymZ8GHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpmD00He+fsBOVhR43VFde2O+aemvDG1D9Bih98scnb54g0iwUFpizB4R3XQ27OPFIr+bPBvg4tHhOlmPtmUk4acCbjmnkkm5XA48Keb+ouH0KH7NbUuR6cs5uU30nO9IRS3uveJy4vCVBNAMjmJmUeikJ5S5nu6aoR+LL0q/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keWbtgid; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keWbtgid"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23508d30142so19362755ad.0
        for <perfbook@vger.kernel.org>; Thu, 19 Jun 2025 21:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750394688; x=1750999488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/MOk0KNN2WZ1zxpcHet6979N8EruiyJQrpqdH/nBSw=;
        b=keWbtgidvGfeis65NjGWeUKkmX7R+ZtlbqiqS4BU1f63eiF8R/ExSvf9BYrpyT3IVQ
         n9w7tdckxuIoP3Z4MPnms364Trz/3l7NPjeRMhP5Z60MYOKSDyUn2DAtu2Y2W+ukC85/
         xUjv5BnjoD2/wBrc+l3idNuLbG76tkACAd0JXNSac/fjXwMJXgECJoW5NpoNmsPm35hw
         dbzAU6bAKnCq4NC6URzzcKvFQf/yt7wI4VVnvyvEKjGERPwcNATNUKHnxQWHhjMT1OUp
         GQxQ4UIivIzY9UR+eVRawEjr8JVsmgksKvMZvLFUUjZPOVS/sFv34TpzBLHA/KFIm1V9
         naMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750394688; x=1750999488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/MOk0KNN2WZ1zxpcHet6979N8EruiyJQrpqdH/nBSw=;
        b=ScSmhyvSH5WfUZG/cvNYxrxRu9cPScqGs9Vv463kE6cwU27Ktu1HSVbbAcxqRoyaCk
         rNs/m7F2+SWiSEaEwbIzDEmIMML0Dgji1Y6ei2/V2R7UJZPEfI8oMNM0Q99+4GaH4pJe
         +DhIgCH8AFiO6DNlL2JPJKjKYLcqIfTpzZdYDR7G+KU2LqNb9zH79rdO+g6gT87lrgSc
         ydQC2XYUkT9v+wY5U6kNOQpn7dEABmwcTdh9FaEbjRd5m6qpe90nNDa+mzwaK9tin3fv
         maFh4nLWJo2KDstXcXVtHd+ZWmenPlKyiHmV2CamSm+0A+hFOVf+Pv0LF6IwT13lDije
         1v4A==
X-Gm-Message-State: AOJu0Yw9HtFrrHNZTf6MFsDmIJtiyFzMIr/BiKf6tkgnrdZTKE5TiVsZ
	F7Q3w3iP+PxwUHNZQtBJCJR80S8Z7TcVZdS9PoFx5BI+IhSuObarqPIl
X-Gm-Gg: ASbGncuADnyjwWqJr3bnL5iEQqobbVDDlJfjTEvP2ejtXT6z1kdznbIMaAfWOVmTfKY
	vKgbVRxOGwYK/B05m9fRTyKCZS+r2qQ6OKZqqQ/aBKoS1CtL2yhTUmGm2LoN0xyN49ja72YIDGl
	GiKPMGCK8C4N1saanyq4+tbZeznc+ebrIJVTfqP/AGw0bVGUrqXbRhb08GlqGOuiU7d1JIM0yK7
	0aSh6yC8/AsPgomarYJwBeYTvkBkpIkujxZ3dWpgUFQibjrYvm9PXcV+c8oQgDDJGzWkXMw0RI4
	PGDp5hfk0cGAhw4WVH+xMjKGXKDBCZDn6tBg88hK9BXP2Obo0hv+8Sa1Ckr3f9oMH60j3a4s40I
	2Rk9CtxPeAJb7o2j2qOqNoEQsPm67T1yb
X-Google-Smtp-Source: AGHT+IH8KPdfdiB7s2RzwAM2OpSzROWZSN1jQlCfC6Vf4mvi4q3i30Beuu0GnGQJz9ANK0A12borVA==
X-Received: by 2002:a17:903:8cb:b0:234:de0a:b36e with SMTP id d9443c01a7336-237d9bd9bc3mr23160225ad.49.1750394687584;
        Thu, 19 Jun 2025 21:44:47 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8610789sm8068255ad.112.2025.06.19.21.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 21:44:47 -0700 (PDT)
Message-ID: <89277ea0-1e60-416d-ac00-526574f74189@gmail.com>
Date: Fri, 20 Jun 2025 13:44:45 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Leonardo Bras <lsoaresp@redhat.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <8820751b-9b42-4408-b388-14f42030b891@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8820751b-9b42-4408-b388-14f42030b891@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sat, 14 Jun 2025 11:33:16 +0900, Akira Yokosawa wrote:
> Subject: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
> 
> Under archlinux-based container runs, non-login shells need to source
> /etc/profile to have package-specific commands such as encguess (under
> /usr/bin/core_perl) appended in its PATH.
> 
> Add the command so that the change in commit 00361e8bb1e5 ("Convert
> *.log files into UTF-8 encoding") to work in gitlab-ci builds.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Leonardo Bras <lsoaresp@redhat.com>
> ---
> Hi Leo,
> 
> I think this should work, but I have not tested under gitlab-ci.
> Can you apply this and see if the message from grep:
> 
>     ...
>     pdflatex 1 for perfbook.pdf
>     grep: perfbook.log: binary file matches     <===
>     ...
> 
> disappears in the build log?

Paul, having failed to hear from Leo, can I ask you to take and push this?
I will see the log of Leo's gitlab-CI job once it finishes.

        Thanks, Akira

> 
>         Thanks, Akira
> --
>  utilities/gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index 60e70a26..f03e39a9 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -23,6 +23,7 @@ generate_pdfs:
>          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
>  
>      script:
> +        - source /etc/profile
>          - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
>  
>      artifacts:
> 
> base-commit: 00361e8bb1e59a0cf7a2a83028fab323f60c2207


Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E96358B6
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1Aus3/Y"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3e8a51e6bso14269115ad.3
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 13:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704490759; x=1705095559; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7CghRlzS9BWsV+6xGBRF6EDFB8KqcDaOJNN3r5i28hk=;
        b=h1Aus3/YtU/F/ovdbXKWInTCsAwgibS1mKIb7w+5RFYvHiVgK22WOBFwD1+tbmX+Z5
         SPfgKvXjPPXRfKdPSrTLTb2k+ZOMUGcLtj4TJPmbNI7pl7rHars6xc9aSZrvX6FVRC1/
         3nS73XLpq1Ln5qL9fpPtE4oOIYoSpnvxWsXgoUPJmg9lQyv9qz3EUAlbeCoqZks1HXjj
         bBn0QRbkIy45Th2lxBsskOFJvr3A6aCmbL/Lwe+cnrM6z9OynUeylOlWZ1Nk0yjM/d4E
         oodkNANccOHBdWb0Phy2ST3xPwKCA++Vp8hsgPMf/D0wM5SsuDN4bgc1K80bKPKB+mKL
         OoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704490759; x=1705095559;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7CghRlzS9BWsV+6xGBRF6EDFB8KqcDaOJNN3r5i28hk=;
        b=a4pQIkVLyHuvuAWOL3P2JyKhW/t7tJ5U/3gxqf1loMIShNIop3R2tY247O5oxl5sew
         n/WzFlei8ibx6Qgkfnh6yKiMBvbonqaOgeGRdnuuE1kD++TNyjaOcKq1Mf19Pk5wTIVM
         wk1am9/jtD9Lc/904B5GVqRAk6X2mE2E0IEmQYdXizQqLT+IRHU44OG1hODFmU+2q5sI
         /FKSr/vmvuZFvjAffMo6VaW6zlSxMThbFSG/9sRi0ufy8ECbcfBHGz+evt2UUvw6SpBR
         9VrRlQqRcrZ23HPlVmQJANWFJzuR7HfvfaB3pv5+LLxoc/Q27rFy+9tr6PnWF1p9D6lQ
         Ul/g==
X-Gm-Message-State: AOJu0YyIWJyddryXFq9gP/x7GnJbz/U6zn+1TASA5S5ISomobuAgWues
	XTB0q+OcgW0rXHNyOcetjuQ=
X-Google-Smtp-Source: AGHT+IGycWgLB+AD6AntTkFbpzQtwoy5WuygTAAxWwKTfJJ6xr8TXYwjfXjRtNt68gXMA1CN9oQHew==
X-Received: by 2002:a17:902:aa87:b0:1d4:6dea:9ad9 with SMTP id d7-20020a170902aa8700b001d46dea9ad9mr73812plr.51.1704490759063;
        Fri, 05 Jan 2024 13:39:19 -0800 (PST)
Received: from [192.168.1.12] ([187.108.125.21])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902e54600b001d495ec2cdfsm1849290plf.33.2024.01.05.13.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 13:39:18 -0800 (PST)
Message-ID: <b49648d42bbd646241edbf4b360adb68d7322cb4.camel@gmail.com>
Subject: Re: [PATCH -perfbook 8/8] gitlab-ci.yml: Install librsvg instead of
 inkscape
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
Date: Fri, 05 Jan 2024 18:39:15 -0300
In-Reply-To: <07aca12c-85f9-4e8c-b0f6-1e502cdd8cc5@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
	 <07aca12c-85f9-4e8c-b0f6-1e502cdd8cc5@gmail.com>
Autocrypt: addr=leobras.c@gmail.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-01-05 at 18:58 +0900, Akira Yokosawa wrote:
> On Arch Linux, rsvg-convert is provided in the librsvg package.
> Install it instead of inkscape.
>=20
> Using rsvg-convert can shorten runtime of CI job for building PDFs
> a bit.
>=20
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Leonardo Bras <leobras.c@gmail.com>
> ---

Hello Akira,=20

I used the leobras-ci branch from gitlab/linux_kernel/perfbook to test your
patchset:=20
https://gitlab.com/linux-kernel/perfbook/-/jobs/5872530547

It generated the pdf successfully, could you check if the images were gener=
ated
correctly?
https://gitlab.com/linux-kernel/perfbook/-/jobs/5872530547/artifacts/browse

> Needs an explicit ACK or Tested-by from Leo.
> Expected order of reduction of build time:  ~10s
>=20
>  utilities/gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index bcda8712..17525fb4 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -19,7 +19,7 @@ generate_pdfs:
>      stage: build
> =20
>      before_script:
> -        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graph=
viz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-l=
iberation
> +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graph=
viz librsvg wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-li=
beration

so s/inkscape/librsvg/ right?=20

It's fine by me.

Thanks!
Leo

>          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.reg=
ular.ttf ~/.local/share/fonts/ && fc-cache
> =20
>      script:


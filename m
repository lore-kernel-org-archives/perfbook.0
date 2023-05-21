Return-Path: <SRS0=EXSE=BK=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684685659; x=1687277659;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbu2V9FoPqrI/8PbmcR8M3NDtukzlmrxT7hL7msQDt8=;
        b=J9I6SSDFmio07cx60nqs1WZkAjX/mK2RGg+f1meBaSZprnDi01eeFdBGOm2KuRqwbc
         /NSQfdLWve6tVHEFj7Ti952GqWEjSHy4e4SxFRUzEa7to04dKRgFwltEcTPVWejrB5Y+
         nS+AugfIGcyxn34STh16nKmVCQXjBnMxdd90zcVXk2twtMmiD028a8jQir2S+6U2eG4v
         iimYiWNlts9/+UVQlnPbVqFCxcEdEwyZrrOBKcAEAKhhcaO8hcPj+vJZMGN/mbebuklT
         Ve5aPEZYKpYx23EOrqE5/PSufWG+hsNMkey0zeI6TJxefSUdrQpSXrDUazqnOUC5sG5L
         NyQA==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] formal: Fix reference
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <20230521160847.2258-1-mmpgouride@gmail.com>
Date: Mon, 22 May 2023 00:13:58 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C695FC5-F499-4351-BC1D-75118F87835D@gmail.com>
References: <20230521160847.2258-1-mmpgouride@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

There is another wrong reference, please ignore this.

I will send another patch.

Thanks,
Alan

> 2023=E5=B9=B45=E6=9C=8822=E6=97=A5 00:08=EF=BC=8CAlan Huang =
<mmpgouride@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> The item cites the wrong reference. This patch fixes that.
>=20
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
> formal/dyntickrcu.tex | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index 42c0c55c..2ed31f84 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -1132,7 +1132,7 @@ This effort provided some lessons (re)learned:
> In this case, the documentation effort located
> a misplaced memory barrier in
> \co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
> - as shown by the following =
patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
> + as shown by the following =
patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
>=20
> \begin{VerbatimU}
>  static inline void rcu_enter_nohz(void)
> --=20
> 2.34.1
>=20


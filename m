Return-Path: <SRS0=OWBg=7U=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679968991;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4QCYJK3cOWisUs2EBvlCaqCLnWmpzKSSaBDa4iBONU=;
        b=YIzywVGww6XCljyPJNeIGv8T4uL1wuj3yyMiKiSJkzlpNB3vuEMYz8WPluA6vPkTfI
         EzKW53Jyh+wLwH4xnv7Cjod4pVRWZedKC7oswYR2iQDcG410idNaVDorxsdm0dB18Ocf
         8LbKgJRlr6EgU6uPKspPfz9axXVr3xmJC3M95+6AqHWUm2XaRSMJMaHHkzSbW4stb0X4
         8LKJrDOQhWi6quJvhMfENDwuTnzAOmdpf4oYvBYjUzoAFNq9Jj4HbxnJUUgkAm3eycZt
         3+/jR5p4fVCvZTwz7Jw6sxt/mplnmK+YYFl0wv8NvuJcHBsfRHyGTOmyWw940sLmFTty
         f4xA==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alan Huang <mmpgouride@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] CodeSamples/count: add necessary partial memory barriers
Date: Tue, 28 Mar 2023 10:02:58 +0800
Message-Id: <322EF303-5C92-4271-A449-4128D8A6EEC2@gmail.com>
References: <20230327164235.399487-1-mmpgouride@gmail.com>
In-Reply-To: <20230327164235.399487-1-mmpgouride@gmail.com>
To: akiyks@gmail.com
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Found another issue, since we store release the theft variable, we should lo=
ad acquire theft in add_count/sub_count.

I will send patch v3.

Thanks,
Alan

> =E5=9C=A8 2023=E5=B9=B43=E6=9C=8828=E6=97=A5=EF=BC=8C00:42=EF=BC=8CAlan Hu=
ang <mmpgouride@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> =EF=BB=BFThis patch add two necessary partial memory barriers, the first o=
ne change
> READ_ONCE to smp_load_acquire to makes sure the reading from theftp[t]
> happens before the reading from counterp[t]. The litmus testing below
> represents the pattern, and the result is "Sometimes":
>=20
> C counter_sig
>=20
> {}
>=20
> P0(int *theft, int *counter)
> {
>    int r0;
>    int r1;
>=20
>    r0 =3D READ_ONCE(*theft);
>    r1 =3D READ_ONCE(*counter);
> }
>=20
> P1(int *theft, int *counter)
> {
>    WRITE_ONCE(*counter, 1);
>    smp_mb();
>    WRITE_ONCE(*theft, 1);
> }
>=20
> exists (0:r0=3D1 /\ 0:r1=3D0)
>=20
> Second one change WRITE_ONCE to smp_store_release to make sure that settin=
g
> counterp[t] happens before the setting theftp[p] to THEFT_IDLE. Here is th=
e
> litmus testing, The result is "Sometimes":
>=20
> C counter_sig_2
>=20
> {
>    int theft =3D 1;
>    int counter =3D 1;
> }
>=20
> P0(int *theft, int *counter)
> {
>    WRITE_ONCE(*counter, 0);
>    WRITE_ONCE(*theft, 0);
> }
>=20
> P1(int *theft, int *counter)
> {
>    if (READ_ONCE(*theft) =3D=3D 0)
>    {
>        smp_mb();
>        WRITE_ONCE(*counter, READ_ONCE(*counter)+1);
>    }
> }
>=20
> P2(int *counter)
> {
>    int r0;
>=20
>    r0 =3D READ_ONCE(*counter);
> }
>=20
> exists (2:r0=3D2)
>=20
> Note that I added one smp_mb() in P1's "if" statement,
> because in add_count/sub_count's fast path, there is a
> control dependency.
>=20
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
> CodeSamples/count/count_lim_sig.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_l=
im_sig.c
> index 023d6215..09582429 100644
> --- a/CodeSamples/count/count_lim_sig.c
> +++ b/CodeSamples/count/count_lim_sig.c
> @@ -81,7 +81,7 @@ static void flush_local_count(void)            //\lnlbl{=
flush:b}
>    for_each_tid(t, tid) {                //\lnlbl{flush:loop2:b}
>        if (theftp[t] =3D=3D NULL)            //\lnlbl{flush:skip:nonexist}=

>            continue;            //\lnlbl{flush:next2}
> -        while (READ_ONCE(*theftp[t]) !=3D THEFT_READY) {//\lnlbl{flush:lo=
op3:b}
> +        while (smp_load_acquire(theftp[t]) !=3D THEFT_READY) {//\lnlbl{fl=
ush:loop3:b}
>            poll(NULL, 0, 1);        //\lnlbl{flush:block}
>            if (READ_ONCE(*theftp[t]) =3D=3D THEFT_REQ)//\lnlbl{flush:check=
:REQ}
>                pthread_kill(tid, SIGUSR1);//\lnlbl{flush:signal2}
> @@ -90,7 +90,7 @@ static void flush_local_count(void)            //\lnlbl{=
flush:b}
>        *counterp[t] =3D 0;
>        globalreserve -=3D *countermaxp[t];
>        *countermaxp[t] =3D 0;            //\lnlbl{flush:thiev:e}
> -        WRITE_ONCE(*theftp[t], THEFT_IDLE);    //\lnlbl{flush:IDLE}
> +        smp_store_release(theftp[t], THEFT_IDLE);    //\lnlbl{flush:IDLE}=

>    }                        //\lnlbl{flush:loop2:e}
> }                            //\lnlbl{flush:e}
>=20
> --=20
> 2.34.1
>=20

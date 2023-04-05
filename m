Return-Path: <SRS0=zLCu=74=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680711217;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+1IffjiXU5kJeOZ7oN09rG2Nc8wyzKXSyW+aq+3wD8=;
        b=fvtfa+ovM2n0+gcC0A0Ab7xIE8LEcEJUsNhYEnAXHYKMkFtLv1kz1NtNxk0I84gdLb
         044pxNOMnmHomkkhjGYt+RKR6lsJ5hhErKd5GiRtjAfLSkzuRJfSRbvx2wFlnsNTg0+I
         ktAzkDVqIFqIwyHqmELlc2FzboQZcrqr9jwv00kMSknRBIxCWMQ1lNRFAvspxMwALlcS
         /25H7ppvWW7eiCu+r2y5x7ETOus5o08MvZLqwcL6NAzdC1wj+i+5pSQd7v1s2nVG/Pcs
         4O8FbPGjuC8zlRWWPVqOb46mNPypO56beFgKgocC9gO5PzQssvxE1MD81R2j37ZU0m46
         LhCg==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] CodeSamples/count: change full memory barrier to
 partial one
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <b0829b05-3c90-197a-50ea-f3ce5cce94ea@gmail.com>
Date: Thu, 6 Apr 2023 00:13:27 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <71285F65-4D77-4B10-B4C1-5184F07E936B@gmail.com>
References: <20230404164753.1317498-1-mmpgouride@gmail.com>
 <b0829b05-3c90-197a-50ea-f3ce5cce94ea@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks for your review!=20

I=E2=80=99ll send a patch only concerning count_stat_eventual.c later.

Thanks,
Alan

> 2023=E5=B9=B44=E6=9C=885=E6=97=A5 =E4=B8=8B=E5=8D=8810:08=EF=BC=8CAkira =
Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> On Tue,  4 Apr 2023 12:47:53 -0400, Alan Huang wrote:
>> The original memory barriers in count_stat_eventual.c ensure
>> writing to global_count happens before writing to stopflag and
>> reading from stopflag happens before later reading from global_count.
>>=20
>> Thus, smp_load_acquire and smp_store_release will suffice.
>=20
> So far, looks good.
> But those smp_mb()s are mentioned in Section 5.2.4.
> Please see inline comments below:
>=20
>>=20
>> In count_lim_sig.c, there is only one ordering required, that is
>> writing to counter happens before setting theft to THEFT_READY in
>> add_count/sub_count's fast path.
>=20
> I'm kind of not 100% sure of your changes in count_lim_sig.c.
> I'll comment in another mail.  That might take a while.
>=20
>>                                 Therefore, partial memory barrier
>> will suffice.
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/count/count_lim_sig.c       | 10 +++-------
>> CodeSamples/count/count_stat_eventual.c |  6 ++----
>> count/count.tex                         |  9 ++++-----
>> 3 files changed, 9 insertions(+), 16 deletions(-)
>>=20
>=20
> [...]
>=20
>> diff --git a/CodeSamples/count/count_stat_eventual.c =
b/CodeSamples/count/count_stat_eventual.c
>> index 967644de..7157ee0e 100644
>> --- a/CodeSamples/count/count_stat_eventual.c
>> +++ b/CodeSamples/count/count_stat_eventual.c
>> @@ -51,8 +51,7 @@ void *eventual(void *arg)				=
//\lnlbl{eventual:b}
>> 		WRITE_ONCE(global_count, sum);
>> 		poll(NULL, 0, 1);
>> 		if (READ_ONCE(stopflag)) {
>> -			smp_mb();
>> -			WRITE_ONCE(stopflag, stopflag + 1);
>> +			smp_store_release(&stopflag, stopflag + 1);
>> 		}
>> 	}
>> 	return NULL;
>> @@ -73,9 +72,8 @@ void count_init(void)					=
//\lnlbl{init:b}
>> void count_cleanup(void)				=
//\lnlbl{cleanup:b}
>> {
>> 	WRITE_ONCE(stopflag, 1);
>> -	while (READ_ONCE(stopflag) < 3)
>> +	while (smp_load_acquire(&stopflag) < 3)
>> 		poll(NULL, 0, 1);
>> -	smp_mb();
>> }							=
//\lnlbl{cleanup:e}
>> //\end{snippet}
>=20
> So, you'd also need to update a paragraph in Section 5.2.4,
> which currently reads:
>=20
>    The count_cleanup() function on lines 48--54 coordinates =
termination.
>    The calls to smp_mb() here and in eventual() ensure that all =
updates to
>    global_count are visible to code following the call to =
count_cleanup().
>=20
> And I think splitting the changes in count_stat_eventual.c and
> count_lim_sig.c into individual patches would ease the review on
> our side.
>=20
> So, can you send a patch concerning count_stat_eventual.c
> first ?
>=20
> I'll comment on count_lim_sig.c later, that is, if Paul won't beat
> me to it.
>=20
>        Thanks, Akira
>=20
>=20


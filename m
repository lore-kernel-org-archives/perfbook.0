Return-Path: <SRS0=NH/g=A6=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683629779; x=1686221779;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yz6qkEGuFo4rqqhBSFtpQ6p2Gv2WPBrHSDVgzMMsYrI=;
        b=Q6JXsJjOf6DzBWndUzBeFDwdihzZai8FqIOSIr8bXrvOQ2ZPFtx/z5tum0WO5Dtqs9
         wFqafZqynWQ6ZjnEHOayfWBDlBpQSMMeDSQCPH0/61+JtlHEPWIv8kEiQISKbXXbN3oJ
         iwPj5CLKRWgWEIX/6hJR4ltoD4H3O5EtzDt3gSAoGgFapl54E30ZAEt+GRGS6GwHwfsr
         b7qstK0jU4I6gqOx7iVKIVdN7LND+AdalpqK9TfLteEuq+E1kXO4h0r6ERRMTl/suMo6
         DhudHeHNS9PAGQf6uGgzPcCgyh7geHJAnTyVNpO+71gC4MispYqB5rlph3HCJRoR6Pu9
         zUxQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] datastruct: Remove outdated content
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <0331e919-4b65-7c3d-0e50-140a31940161@gmail.com>
Date: Tue, 9 May 2023 18:56:01 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A6A8979-9BDC-4237-B6E2-B877F814F7CF@gmail.com>
References: <20230508172748.31803-1-mmpgouride@gmail.com>
 <0331e919-4b65-7c3d-0e50-140a31940161@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thank you for your review and suggestions!

I have sent patch v2.

Thanks,
Alan

> 2023=E5=B9=B45=E6=9C=889=E6=97=A5 08:05=EF=BC=8CAkira Yokosawa =
<akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> On Mon,  8 May 2023 17:27:48 +0000, Alan Huang wrote:
>> The code of resizable hash table has been updated so that it doesn't
>> need to compute the hash twice since 2019. Here are some related
>> commits:
>> 2ea492b,
>> 2a7f20d,
>>  ...
>=20
> Can you say (as recommended in patches to Linux kernel) ?:
>=20
>    2ea492bbab9d ("datatruct/hash: Don't recompute hashes in =
hashtab_add()")
>    2a7f20d234e7 ("datastruct/hash: Don't recompute hashes in =
hashtab_del()")
>=20
> (hashes of 7 chars should be sufficient for perfbook, but our eyes
> expect 12 chars ...)
>=20
>> So, the patch removes the outdated content.
>=20
> Indeed.
>=20
> However, -nq builds need additional tweaks appended below (on top).
> Can you do a respin with my Rb tag.
>=20
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
>=20
> See qqz.sty's header comment for the format of consecutive QQz's.
>=20
>        Thanks, Akira
>=20
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 9aa04bb5db2e..0242ccc7ba4b 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -2017,10 +2017,10 @@ which could allow the compiler to inline the =
resulting fixed functions,
> eliminating not only the overhead of the call instruction, but the
> argument marshalling as well.
>=20
> -\QuickQuizE{
> +\QuickQuiz{
> How much do these specializations really save?
> Are they really worth it?
> -}\QuickQuizAnswerE{
> +}\QuickQuizAnswer{
> The answer to the first question is left as an exercise to
> the reader.
> Try specializing the resizable hash table and see how much
> @@ -2029,7 +2029,7 @@ argument marshalling as well.
> instead be answered with respect to a specific use case.
> Some use cases are extremely sensitive to performance and
> scalability, while others are less so.
> -}\QuickQuizEndE
> +}\QuickQuizEnd
>=20
> All that aside, one of the great benefits of modern hardware compared
> to that available when I first started learning to program back in
>=20


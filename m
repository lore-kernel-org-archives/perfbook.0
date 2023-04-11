Return-Path: <SRS0=iPZS=AC=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681230854;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq+ePDTeAT8BwiXEZbWy6+9MnYTagH8chJxnVjsF8gw=;
        b=praOtPSYBmntj4R5XbHSW8/wlTlpW6vUHIQcPtXkX93v9LdlqedYC+MNk7tUnh9vXG
         Byv4U3A1ohrEJI0ocd+bV5aefBtKGsYkd6T5VR2XJ6aMLjvw1xMQ6zwVwgae7vbUTuCf
         8kIN/Y3UwYfO0j8DpJPj8kItQStZkPywTH4gx3TzfW0wEawhNqzFVvWGnUV9zSuAEEY1
         Em9smBImk/jbdtnnhBSOzorlBRyTwcWdVGNCPq6kdq33PPgI1of+8QoVBX3/n8E133YV
         GP+2FvZxyvWRUYY/rhUWGQ5X1VGZKFQVWxQofmlpZ53TA8PH5LNdxFvDaBGjVqupiR3W
         OyBw==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <a1cf12cc-0f93-4958-a5f1-63827eccba48@paulmck-laptop>
Date: Wed, 12 Apr 2023 00:34:06 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <721A2BB5-7E15-474A-B6AF-AFE8E310A616@gmail.com>
References: <20230407175813.1334028-1-mmpgouride@gmail.com>
 <81ADBFE2-3576-48EC-A892-B49A5C265487@gmail.com>
 <e425c28d-c285-0fc6-b692-744df0bde3a8@gmail.com>
 <a1cf12cc-0f93-4958-a5f1-63827eccba48@paulmck-laptop>
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

The signal-theft counter reminds me of the signal-based user space RCU =
implementation, the signal hander there=20
has  two full memory barriers around it, how about mentioning that a =
little?

Thanks,
Alan



> 2023=E5=B9=B44=E6=9C=8811=E6=97=A5 =E4=B8=8A=E5=8D=883:06=EF=BC=8CPaul =
E. McKenney <paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sun, Apr 09, 2023 at 09:11:58AM +0900, Akira Yokosawa wrote:
>> Hi,
>>=20
>> On Sat, 8 Apr 2023 02:04:24 +0800, Alan Huang wrote:
>>> Hi Paul and Akira,
>>>=20
>>> This is the patch v3, I forgot to add a version tag=E2=80=A6
>>>=20
>>> And I think it may be better to add a question in a subsequent path.
>>=20
>> So I'm looking at Quick Quizzes on count_lim_sig.c.
>> It looks to me Quick Quiz 5.50 lost its context due to the
>> removal of smp_mb() and the use of smp_store_release().
>>=20
>> A band-aide fix would be to change the quiz to:
>>=20
>>    In Listing 5.18's function flush_local_count_sig(), why
>>    are there READ_ONCE(), WRITE_ONCE(), and smp_store_release()
>>    wrappers around the uses of the theft per-thread variable?
>>=20
>> , and to adjust the line count in its Answer.
>>=20
>> However, smp_store_release() is by no means a simple wrapper.
>> So I'm wondering if it is worthwhile to keep this quiz.
>>=20
>> Paul, how about replacing the quiz with the new quiz asking:
>>=20
>>     In Listing 5.18, doesn't flush_local_count_sig() need
>>     a stronger memory barrier or two?
>>=20
>> , and picking Alan's reasoning in the answer?
>=20
> How about something like this?
>=20
> 							Thanx, Paul
>=20
> =
------------------------------------------------------------------------
>=20
> diff --git a/count/count.tex b/count/count.tex
> index 2aade053..ccc2e839 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2441,28 +2441,11 @@ the fastpath happens before this change of =
\co{theft} to READY\@.
>=20
> \QuickQuiz{
> 	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration =
Functions}'s
> -	function \co{flush_local_count_sig()}, why are there
> -	\co{READ_ONCE()} and \co{WRITE_ONCE()} wrappers around
> -	the uses of the
> -	\co{theft} per-thread variable?
> +	doesn't \co{flush_local_count_sig()} need stronger memory =
barriers?
> }\QuickQuizAnswer{
> -	\begin{fcvref}[ln:count:count_lim_sig:migration:flush_sig]
> -	The first one (on \clnref{check:REQ}) can be argued to be =
unnecessary.
> -	The last two (\clnref{set:ACK,set:READY}) are important.
> -	If these are removed, the compiler would be within its rights
> -	to rewrite \clnrefrange{set:ACK}{set:READY} as follows:
> -	\end{fcvref}
> -
> -\begin{VerbatimN}[firstnumber=3D14]
> -theft =3D THEFT_READY;
> -if (counting) {
> -	theft =3D THEFT_ACK;
> -}
> -\end{VerbatimN}
> -
> -	This would be fatal, as the slowpath might see the transient
> -	value of \co{THEFT_READY}, and start stealing before the
> -	corresponding thread was ready.
> +	No, that \co{smp_store_release()} suffices because this code
> +	communicates only with \co{flush_local_count()}, and there is
> +	no need for store-to-load ordering.
> }\QuickQuizEnd
>=20
> \begin{fcvref}[ln:count:count_lim_sig:migration:flush]


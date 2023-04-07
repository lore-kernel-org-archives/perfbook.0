Return-Path: <SRS0=Dz0b=76=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680874375;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5Rp25KNjaQFyZv47N3ZUCo0h+DciLs6G4JaB/Ew7IY=;
        b=FOf3x7b6J9rhQc0biyoYiHcxr7yo/RR1eXFFAW5rRGgul2Sj0Pm2fBzjsnGjJehKbJ
         bRQWz1NC1tcLMa627Ilk3/PRx4tOfHUqNY8pfrINFyh4TYTjVbqajfSmHZX/T7/omwbS
         S9iYcqiJJJ2c8WPqXzAA8RFUoYkGqqgf2JvXxj1o8x8jmKOxZZAJUGtgXlgUthUpqn+6
         GAn7DdsZ2DFOD7CKy2mg4ctJs1VYFwVp7/ZmzkTqki8GywvgMYof4zHk+iZ98UUAgHKR
         3Obhn8fs5SAUZqqkhuZg6sMLnI+bbniaQcrB8HSFKMXg6fhaPjz/99Gv3yUKZ1PDioX+
         LMuw==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2] CodeSamples/count: change full memory barrier to
 partial one
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <adbcc555-caef-917b-6a79-6016cf5309fa@gmail.com>
Date: Fri, 7 Apr 2023 21:32:36 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <6AD6A942-674B-42FC-9734-53223102D7C1@gmail.com>
References: <20230404164753.1317498-1-mmpgouride@gmail.com>
 <653947fc-3846-32a5-4386-35abd39b792b@gmail.com>
 <974D932F-4061-4189-B29B-B7A1C1E6868D@gmail.com>
 <adbcc555-caef-917b-6a79-6016cf5309fa@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks for the suggestion!

I=E2=80=99ll send patch v3 later.

Thanks,
Alan

> 2023=E5=B9=B44=E6=9C=887=E6=97=A5 10:14=EF=BC=8CAkira Yokosawa =
<akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, 7 Apr 2023 00:29:21 +0800, Alan Huang wrote:
>> Hi Akira,
>>=20
>>> Do you have a good reasoning why the pair of smp_mb()s can be safely
>>> replaced with the single smp_store_release() ?
>>=20
>> When the signal handler is running, there is only one thread waiting =
on the while loop in flush_local_count,
>> which means we only need to synchronize with that thread, and that =
thread only cares the THEFT_READY status,
>> we just need to make sure after that thread seeing theft equals =
THEFT_READY, it can also see the changes to counter.
>>=20
>> And because the signal handler is running on the interrupted thread, =
we don=E2=80=99t need any memory barrier.
>=20
> OK, now I'm convinced.  You are right!
>=20
> Let's see your changes in corresponding text:
>=20
>> diff --git a/count/count.tex b/count/count.tex
>> index 80ada104..899ea7e9 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -2425,12 +2425,11 @@ handler used in the theft process.
>> \Clnref{check:REQ,return:n} check to see if
>> the \co{theft} state is REQ, and, if not
>> returns without change.
>> -\Clnref{mb:1} executes a \IX{memory barrier} to ensure that the =
sampling
>> -of the theft variable happens before any change to that variable.
>> \Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
>> \clnref{check:fast} sees that
>> this thread's fastpaths are not running, \clnref{set:READY} sets the =
\co{theft}
>> -state to READY\@.
>> +state to READY, the release store here is to ensure that the change =
to counter
>> +in fast path happens before changing the theft varibale to READY\@.
>      the fastpath                                variable
>=20
> I can't parse this sentence grammatically.
>=20
> This sentence is rendered as follows (with minor nits fixed):
>=20
>    Line 13 sets the theft state to ACK, and, if line 14 sees that this
>    thread's fastpaths are not running, line 15 sets the theft state
>    to READY, the release store here is to ensure that the change to
>    counter in the fastpath happens before changing the theft variable
>    to READY.
>=20
> How about this?
>=20
>    Line 13 sets the theft state to ACK, and, if line 14 sees that this
>    thread's fastpaths are not running, line 15 sets the theft state
>    to READY, with the release store ensuring any change to counter in
>    the fastpath happens before the change of theft to READY.
>=20
>=20
> Also, I'd like to see your reasoning above mentioned somewhere around
> here.  Might worth a Quick Quiz.
>=20
>    Question:
>    Doesn't flush_local_count_sig() need a full memory barrier?
>=20
>> \end{fcvref}
>>=20
>> \begin{listing}
>> @@ -2595,8 +2594,8 @@ handlers to undertake theft.
>> \Clnref{barrier:3} again disables compiler reordering, and then
>> \clnref{check:ACK}
>> checks to see if the signal handler deferred the \co{theft}
>> -state-change to READY, and, if so, \clnref{mb} executes a memory
>> -barrier to ensure that any CPU that sees \clnref{READY} setting =
state to
>> +state-change to READY, and, if so, the release store at =
\clnref{READY}
>> +is to ensure that any CPU that sees \clnref{READY} setting state to
>> READY also sees the effects of \clnref{add:f}.
>=20
> Again, this looks to me incomplete in grammatical structure.
>=20
> This sentence is rendered as follows:
>=20
>    Line 14 again disables compiler reordering, and then line 15 checks
>    to see if the signal handler deferred the theft state-change to =
READY,
>    and, if so, the release store at line 16 is to ensure that any CPU
>    that sees line 16 setting state to READY also sees the effects of
>    line 9.
>=20
> How about something like this?
>=20
>    Line 14 again disables compiler reordering, and then line 15 checks
>    to see if the signal handler deferred the theft state-change to =
READY,
>    and, if so, line 16 changes theft to READY with the release store
>    ensuring that any CPU that sees the READY state also sees the =
effects
>    of line 9.
>=20
> Paul might have better ideas. ;-)
>=20
>=20
>> If the fastpath addition at \clnref{add:f} was executed, then
>> \clnref{return:fs} returns
>=20
> Can you post a v3 with whatever text-side updates you come up with?
>=20
>        Thanks, Akira
>=20
>>=20
>> Please correct me if I'm wrong.
>>=20
>> Thanks,
>> Alan



Return-Path: <SRS0=L/5h=AD=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681299177; x=1683891177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XlO74WozzIiSdtK02DM8BMQbHtG3it9Pkeq80Qb9XI=;
        b=WlTgFLPFaN7jOOZAbS5oNOOFSCUzmmLIcriBc5MIzm7tRRFxalpXDUXGa9PsiSTSDz
         pb2Mc020yOs8rGs9X2SHCkN/MdwPnfUcma18yy6qPwomyuUV+2qHnAvouj+AaV432DMq
         o+kHadMblsQSLLRCiKQrsPT7isXsWiML55wJo8kpTo8qezf5c50HjQG6uh8BFiXKvTY7
         cOdN/ix9vsScszAmydh5zNhe0fRH9JSjJ2cp/arId0UzSg7sWExlgf11NJl8fRcupqaG
         RzxpKtA4uph5HlNbu07tVTD/Vv+Jeho5AbgZJe8bocgyCO2AlHtqs+HZwfSBx1xPUcpT
         JFGQ==
MIME-Version: 1.0
References: <20230407175813.1334028-1-mmpgouride@gmail.com>
 <81ADBFE2-3576-48EC-A892-B49A5C265487@gmail.com> <e425c28d-c285-0fc6-b692-744df0bde3a8@gmail.com>
 <a1cf12cc-0f93-4958-a5f1-63827eccba48@paulmck-laptop> <721A2BB5-7E15-474A-B6AF-AFE8E310A616@gmail.com>
In-Reply-To: <721A2BB5-7E15-474A-B6AF-AFE8E310A616@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 12 Apr 2023 07:32:45 -0400
Message-ID: <CAJbg=FUKnNRiu2O0wAav9dAMcKuSH5CNHZWrqCOXUiZDt5t-jw@mail.gmail.com>
Subject: Re: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Alan Huang <mmpgouride@gmail.com>
Cc: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

I may be missing something, but why do you need memory barriers at all
in the signal handler? At least on the systems I know both setting up
the signal handler and restoring the context require kernel calls. On
x86 this doesn't matter as it is strongly ordered, but on ARM the
kernel calls provide full synchronization points.
Are there architectures/OS combinations where that is not true?

--Elad

On Tue, Apr 11, 2023 at 12:43=E2=80=AFPM Alan Huang <mmpgouride@gmail.com> =
wrote:
>
> The signal-theft counter reminds me of the signal-based user space RCU im=
plementation, the signal hander there
> has  two full memory barriers around it, how about mentioning that a litt=
le?
>
> Thanks,
> Alan
>
>
>
> > 2023=E5=B9=B44=E6=9C=8811=E6=97=A5 =E4=B8=8A=E5=8D=883:06=EF=BC=8CPaul =
E. McKenney <paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Sun, Apr 09, 2023 at 09:11:58AM +0900, Akira Yokosawa wrote:
> >> Hi,
> >>
> >> On Sat, 8 Apr 2023 02:04:24 +0800, Alan Huang wrote:
> >>> Hi Paul and Akira,
> >>>
> >>> This is the patch v3, I forgot to add a version tag=E2=80=A6
> >>>
> >>> And I think it may be better to add a question in a subsequent path.
> >>
> >> So I'm looking at Quick Quizzes on count_lim_sig.c.
> >> It looks to me Quick Quiz 5.50 lost its context due to the
> >> removal of smp_mb() and the use of smp_store_release().
> >>
> >> A band-aide fix would be to change the quiz to:
> >>
> >>    In Listing 5.18's function flush_local_count_sig(), why
> >>    are there READ_ONCE(), WRITE_ONCE(), and smp_store_release()
> >>    wrappers around the uses of the theft per-thread variable?
> >>
> >> , and to adjust the line count in its Answer.
> >>
> >> However, smp_store_release() is by no means a simple wrapper.
> >> So I'm wondering if it is worthwhile to keep this quiz.
> >>
> >> Paul, how about replacing the quiz with the new quiz asking:
> >>
> >>     In Listing 5.18, doesn't flush_local_count_sig() need
> >>     a stronger memory barrier or two?
> >>
> >> , and picking Alan's reasoning in the answer?
> >
> > How about something like this?
> >
> >                                                       Thanx, Paul
> >
> > -----------------------------------------------------------------------=
-
> >
> > diff --git a/count/count.tex b/count/count.tex
> > index 2aade053..ccc2e839 100644
> > --- a/count/count.tex
> > +++ b/count/count.tex
> > @@ -2441,28 +2441,11 @@ the fastpath happens before this change of \co{=
theft} to READY\@.
> >
> > \QuickQuiz{
> >       In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Fun=
ctions}'s
> > -     function \co{flush_local_count_sig()}, why are there
> > -     \co{READ_ONCE()} and \co{WRITE_ONCE()} wrappers around
> > -     the uses of the
> > -     \co{theft} per-thread variable?
> > +     doesn't \co{flush_local_count_sig()} need stronger memory barrier=
s?
> > }\QuickQuizAnswer{
> > -     \begin{fcvref}[ln:count:count_lim_sig:migration:flush_sig]
> > -     The first one (on \clnref{check:REQ}) can be argued to be unneces=
sary.
> > -     The last two (\clnref{set:ACK,set:READY}) are important.
> > -     If these are removed, the compiler would be within its rights
> > -     to rewrite \clnrefrange{set:ACK}{set:READY} as follows:
> > -     \end{fcvref}
> > -
> > -\begin{VerbatimN}[firstnumber=3D14]
> > -theft =3D THEFT_READY;
> > -if (counting) {
> > -     theft =3D THEFT_ACK;
> > -}
> > -\end{VerbatimN}
> > -
> > -     This would be fatal, as the slowpath might see the transient
> > -     value of \co{THEFT_READY}, and start stealing before the
> > -     corresponding thread was ready.
> > +     No, that \co{smp_store_release()} suffices because this code
> > +     communicates only with \co{flush_local_count()}, and there is
> > +     no need for store-to-load ordering.
> > }\QuickQuizEnd
> >
> > \begin{fcvref}[ln:count:count_lim_sig:migration:flush]
>

Return-Path: <SRS0=FVB+=76=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680833679; x=1683425679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AF5W84ZXAr7bWsXmlSdSoiEXdb6RZ0p+IEURBV8dQoQ=;
        b=C7OhJtGYwPGz3iiWCKzZg7bIPmHiEbOJz8ykNPv5jWrREzVBRYvG5zM0OVHekfLv4l
         2cPK3jfU+0sPGRP1Aziyt+HIrvmlXB8lJ9pzgi1BUeG//eJHKnM/gje0GAVu+ruoGkuk
         Yl9og0C1Vp2O6iV7FDX+bvDBFAGfahJHXBTnd22xq9M6i26Wv15vEzqmTqib9lhcuEoy
         8zK0xR2+AaqWREv0IXoZP0rCzUL3LPiuJcoWO6JbU8BzEXPse4naJ698OTWT+MCn184Q
         R5N21uMuKMUh6puMqsShGepte+VtSwktNOaC7oZPoGMEdwdqQbmeEJD/LL5oX3/iP8uB
         t1nQ==
Message-ID: <adbcc555-caef-917b-6a79-6016cf5309fa@gmail.com>
Date: Fri, 7 Apr 2023 11:14:35 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v2] CodeSamples/count: change full memory barrier to
 partial one
References: <20230404164753.1317498-1-mmpgouride@gmail.com>
 <653947fc-3846-32a5-4386-35abd39b792b@gmail.com>
 <974D932F-4061-4189-B29B-B7A1C1E6868D@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <974D932F-4061-4189-B29B-B7A1C1E6868D@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Alan Huang <mmpgouride@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 7 Apr 2023 00:29:21 +0800, Alan Huang wrote:
> Hi Akira,
>=20
>> Do you have a good reasoning why the pair of smp_mb()s can be safely
>> replaced with the single smp_store_release() ?
>=20
> When the signal handler is running, there is only one thread waiting on=
 the while loop in flush_local_count,
> which means we only need to synchronize with that thread, and that thre=
ad only cares the THEFT_READY status,
> we just need to make sure after that thread seeing theft equals THEFT_R=
EADY, it can also see the changes to counter.
>=20
> And because the signal handler is running on the interrupted thread, we=
 don=E2=80=99t need any memory barrier.

OK, now I'm convinced.  You are right!

Let's see your changes in corresponding text:

> diff --git a/count/count.tex b/count/count.tex
> index 80ada104..899ea7e9 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2425,12 +2425,11 @@ handler used in the theft process.
>  \Clnref{check:REQ,return:n} check to see if
>  the \co{theft} state is REQ, and, if not
>  returns without change.
> -\Clnref{mb:1} executes a \IX{memory barrier} to ensure that the sampli=
ng
> -of the theft variable happens before any change to that variable.
>  \Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
>  \clnref{check:fast} sees that
>  this thread's fastpaths are not running, \clnref{set:READY} sets the \=
co{theft}
> -state to READY\@.
> +state to READY, the release store here is to ensure that the change to=
 counter
> +in fast path happens before changing the theft varibale to READY\@.
      the fastpath                                variable

I can't parse this sentence grammatically.

This sentence is rendered as follows (with minor nits fixed):

    Line 13 sets the theft state to ACK, and, if line 14 sees that this
    thread's fastpaths are not running, line 15 sets the theft state
    to READY, the release store here is to ensure that the change to
    counter in the fastpath happens before changing the theft variable
    to READY.

How about this?

    Line 13 sets the theft state to ACK, and, if line 14 sees that this
    thread's fastpaths are not running, line 15 sets the theft state
    to READY, with the release store ensuring any change to counter in
    the fastpath happens before the change of theft to READY.


Also, I'd like to see your reasoning above mentioned somewhere around
here.  Might worth a Quick Quiz.

    Question:
    Doesn't flush_local_count_sig() need a full memory barrier?

>  \end{fcvref}
> =20
>  \begin{listing}
> @@ -2595,8 +2594,8 @@ handlers to undertake theft.
>  \Clnref{barrier:3} again disables compiler reordering, and then
>  \clnref{check:ACK}
>  checks to see if the signal handler deferred the \co{theft}
> -state-change to READY, and, if so, \clnref{mb} executes a memory
> -barrier to ensure that any CPU that sees \clnref{READY} setting state =
to
> +state-change to READY, and, if so, the release store at \clnref{READY}=

> +is to ensure that any CPU that sees \clnref{READY} setting state to
>  READY also sees the effects of \clnref{add:f}.

Again, this looks to me incomplete in grammatical structure.

This sentence is rendered as follows:

    Line 14 again disables compiler reordering, and then line 15 checks
    to see if the signal handler deferred the theft state-change to READY=
,
    and, if so, the release store at line 16 is to ensure that any CPU
    that sees line 16 setting state to READY also sees the effects of
    line 9.

How about something like this?

    Line 14 again disables compiler reordering, and then line 15 checks
    to see if the signal handler deferred the theft state-change to READY=
,
    and, if so, line 16 changes theft to READY with the release store
    ensuring that any CPU that sees the READY state also sees the effects=

    of line 9.

Paul might have better ideas. ;-)


>  If the fastpath addition at \clnref{add:f} was executed, then
>  \clnref{return:fs} returns

Can you post a v3 with whatever text-side updates you come up with?

        Thanks, Akira

>=20
> Please correct me if I'm wrong.
>=20
> Thanks,
> Alan
>=20


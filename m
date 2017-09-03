Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uAP2d8S9KryN2sxeDWXVFBVYIokZEjxFlppPOXa79KE=;
 b=nNOa/08O1QWvNw88150AdX+TD+MQLYPFiV5HgovgULj5zAU8XLSPs+maBp44KKncg3
 zKH+V+lueqx6oOga+wLvFY4/t1LnAZS3rw3KPXUwGNrluzGB2gZqKjeH67t8Q+k3bYN6
 RMPTr2So9dVs/hAynaxaaeBB9MltR7m9XsDBIyeXAc6wKpCzyPz7IoVJu0BHBqJcbaa+
 /hhenmAq7Np7GYfyf92wZURtCvIut+PtyNoabkT198JtvumG3+MIOQghEtybaxHvVJW1
 1zd8hyhqGNbE3K3TfM7Oarm3XKzRNNfYb3uWNQhr2CtyYPOI1ac0VCr8bMKTVEzQRct3
 1QCA==
Subject: Re: Other-multicopy atomicity
References: <a5f7959b-cfe3-9bc3-3f65-7b1f9577ad99@gmail.com>
 <20170903005744.GK19872@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <182931cd-d656-217d-c72d-c3599ec3d32f@gmail.com>
Date: Sun, 3 Sep 2017 11:02:55 +0900
In-Reply-To: <20170903005744.GK19872@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/09/02 17:57:44 -0700, Paul E. McKenney wrote:
> On Sat, Sep 02, 2017 at 01:09:37PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I have a comment on the term "other-multicompy atomicity".
>>
>> It took a while for me to realize that the "other-" stands for "other th=
an self CPU".
>> At first, it sounded like "other type of multicompy atomicity", which lo=
oked
>> quite vague.
>>
>> Commit 43236beadb1 ("memorder: Expand on cumulativity and {other,} multi=
copy
>> atomicity") helped me to realize your intention. May I suggest to add a =
footnote
>> on the use of "other-"?
>=20
> I am trying to do a bit too much with that paragraph, aren't I?
>=20
> How about the patch below?

Please see the comments below.

>=20
>> Also, you failed to replace tabs to white spaces in listing added in the
>> above mentioned commit.
>=20
> Good eyes, fixed!  (Not yet pushed, will get there.)
>=20
> 							Thanx, Paul
>=20
> ------------------------------------------------------------------------
>=20
> commit 87b29716cee78c5505039ba933c2f991ed3b1dec
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Sat Sep 2 17:48:39 2017 -0700
>=20
>     memorder: Clarify other-multicopy atomicity
>=20=20=20=20=20
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>=20
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 62544ae8ed52..90e2b5e2f294 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1703,32 +1703,32 @@ and other counterintuitive behavior, as discussed=
 in the next section.
>=20=20
>  Threads running on a \emph{multicopy atomic}~\cite{Stone:1995:SP:623262.=
623912}
>  platform are guaranteed
> -to agree on the order of writes, even to different variables.
> +to agree on the order of stores, even to different variables.
>  A useful mental model of such a system is the single-bus architecture
>  shown in
>  Figure~\ref{fig:memorder:Global System Bus And Multi-Copy Atomicity}.
> -If each write resulted in a message on the bus, and if the bus could
> -accommodate only one write at a time, then any pair of CPUs would
> -agree on the order of all writes that they observed.
> +If each store resulted in a message on the bus, and if the bus could
> +accommodate only one store at a time, then any pair of CPUs would
> +agree on the order of all stores that they observed.
>  Unfortunately, building a computer system as shown in the figure,
>  without store buffers or even caches, would result in glacial computatio=
n.
> -CPU vendors have therefore taken one of three approaches:
> -(1)~Provide store buffers, caches, and the rest and abandon
> -multicopy atomicity (weakly ordered platforms),
> -(2)~Provide all those hardware optimizations, and invest many transistors
> -into preserving multicopy atomicity (TSO platforms), or
> -(3)~Define a slightly weaker \emph{other-multicopy atomicity} that allows
> -a given CPU's stores to become visible to that CPU before they become vi=
sible
> -to other CPUs, but in which each of those stores becomes visible to all
> -the other CPUs simultaneously~\cite{ARMv8A:2017}.
> -Perhaps there will come a day when all platforms provide some flavor
> -of multi-copy atomicity, but
> -in the meantime, non-multicopy-atomic platforms do exist, and so software
> -does need to deal with them.
> +CPU vendors interested in providing multicopy atomicity have therefore
> +instead provided the slightly weaker
> +\emph{other-multicopy atomicity}~\cite{ARMv8A:2017},

On the ARMv8 multicopy atomicity, I found a paper "Simplifying ARM Concurre=
ncy:
Multicopy-atomic Axiomatic and Operational Models for ARMv8" at
https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.cl.cam.ac.uk_-7Ep=
es20_armv8-2Dmca_armv8-2Dmca-2Ddraft.pdf&d=3DDwICaQ&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3D1JFkyKvDbZmHr-CRbzC=
5HuCgZZCSnpvTioqYoFTfMog&s=3DBdlEGULkAzO_ibDzx4a3IT6_-zC815dPjOwJa9qPLLo&e=
=3D  (Draft, July 12, 2017)
by Christopher Pulte, et.al. It is a draft, but could also be cited here.
As you know, "ARM ARM" is quite a large document. If you specified where to=
 look
in the manual, it would be even better.

> +which excludes the CPU doing a given store from the requirement that all
> +CPUs agree on the order of all stores.
> +This means that if only a subset of CPUs are doing stores, the
> +other CPUs will agree on the order of stores, hence the ``other''
> +in ``other-multicopy atomicity''.

Yes, now the meaning of "other-" is clear enough.

      Thanks, Akira

> +Unlike multicopy-atomic platforms, within other-multicopy-atomic platfor=
ms,
> +the CPU doing the store is permitted to observe its
> +store early, which allows its later loads to obtain the newly stored
> +value directly from the store buffer.
> +This in turn improves performance.
>=20=20
>  \QuickQuiz{}
>  	Can you give a specific example showing different behavior for
> -	multicopy atomic on the one hand and other multicopy atomic
> +	multicopy atomic on the one hand and other-multicopy atomic
>  	on the other?
>  \QuickQuizAnswer{
>  \begin{listing}[tbp]
> @@ -1790,6 +1790,12 @@ exists (1:r1=3D1 /\ 1:r2=3D0)
>  	which in turn allows the \co{exists} clause to trigger.
>  } \QuickQuizEnd
>=20=20
> +
> +Perhaps there will come a day when all platforms provide some flavor
> +of multi-copy atomicity, but
> +in the meantime, non-multicopy-atomic platforms do exist, and so software
> +does need to deal with them.
> +
>  \begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}[\LstLineNo]
>=20
>=20


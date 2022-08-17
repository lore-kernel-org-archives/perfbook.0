Return-Path: <SRS0=WSP0=YV=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=vaq6pzFzHQjahYrPWYLWBPuGSDLqNaFj5s9Lqp1yjos=;
        b=eaPzBrZm6KTUB4zEcr6N9cEeVWOA2sQPVlD8rzbegqKlYGHPrffhr/C7vYC85HLo6R
         AvuuQtsJlVNxfzJi80LZIPEhFYJgpr57vTzc/DdH+JkiFN3ke4B0BdlDEDHzx2D1Helo
         TB0UrBYBo//GrcHEfeEL0KUs5jAzZWI2Jf4IdshUKfUouLeLTevysHxYpySw+gXQ8DBw
         krXW2KoECw3tgDkgIqjCwjCGCYJP1WOf6mzh2s/CFbH7TO9vlkWZIb2bCD/SheAeT7Bd
         rQkRJD0oQdaxa0qrVQoOZPoEEsHKGDGX7ntFi6DnNoeG0oAlZW/kFV03NFfA+ZxlggWY
         XRXA==
MIME-Version: 1.0
References: <20220817110049.182128-1-e2lahav@gmail.com> <0dfcdb91-12d7-86f7-4c8d-26a101bec7b5@gmail.com>
In-Reply-To: <0dfcdb91-12d7-86f7-4c8d-26a101bec7b5@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Wed, 17 Aug 2022 13:36:43 -0400
Message-ID: <CAJbg=FW02u8dCHnTE9nEUtvGvVQKpEzUZByXs0O0qc9hQK6XyA@mail.gmail.com>
Subject: Re: [PATCH v2] count: Switch from GCC to C11 thread-local storage
Content-Type: multipart/alternative; boundary="000000000000a301d205e6734f85"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--000000000000a301d205e6734f85
Content-Type: text/plain; charset="UTF-8"

Hi Akira,

The reason for the change is that using C11 is more portable. I have no
problem dropping it if it causes any problems.

That said, there is a simple solution to the issue you are facing. The
-std=c11 option specifies strict adherence to ISO C, without extensions.
You rarely want that. Instead, specify -std=gnu11, which will give you C11
plus POSIX plus GNU extensions.

--Elad

On Wed., Aug. 17, 2022, 11:18 a.m. Akira Yokosawa, <akiyks@gmail.com> wrote:

> Hi Elad,
>
> On Wed, 17 Aug 2022 07:00:50 -0400, Elad Lahav wrote:
> > Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> > ---
>
> As there is no changelog here, let me ask a (maybe stupid) question.
>
> What is your goal of diverting from GCC extensions and switching
> to the C11 standard?
>
> Do you want the codebase under CodeSamples/ to be strictly
> conformant to C11 or later?
>
> Runnig "make" under CodeSamples/count, with "-std=c11" appended
> to GCC_ARGS, I get a lot of compile errors/warnings (with GCC 9.4.0
> under Ubuntu 20.04), beginning with:
>
>     cc -g -O2 -Wall -std=c11  -o count_atomic count_atomic.c -lpthread
>
>     In file included from /usr/include/sched.h:34,
>
>                      from /usr/include/pthread.h:22,
>
>                      from ../api.h:159,
>
>                      from count_atomic.c:22:
>
>     /usr/include/time.h:113:5: error: unknown type name 'locale_t'
>
>       113 |     locale_t __loc) __THROW;
>
>           |     ^~~~~~~~
>
>
> A workaround is to append "-D_GNU_SOURCE" to GCC_ARGS.  With that,
> I get the next warning of:
>
>     ../api.h:766:2: warning: implicit declaration of function 'typeof'
> [-Wimplicit-function-declaration]
>
>   766 |  typeof(*ptr) _____actual = (o); \
>
>
> Apparently, typeof() is another GCC extension.  __typeof__() might
> be used instead, but it is not ISO C.
>
> So what is you goal of these switches?
>
>         Thanks, Akira
>
> >  CodeSamples/count/count_end.c | 12 ++++++------
> >  count/count.tex               | 20 ++++++++++++--------
> >  2 files changed, 18 insertions(+), 14 deletions(-)
> >
> [...]
>

--000000000000a301d205e6734f85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Akira,<div dir=3D"auto"><br></div><div dir=3D"auto">Th=
e reason for the change is that using C11 is more portable. I have no probl=
em dropping it if it causes any problems.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">That said, there is a simple solution to the issue you ar=
e facing. The -std=3Dc11 option specifies strict adherence to ISO C, withou=
t extensions. You rarely want that. Instead, specify -std=3Dgnu11, which wi=
ll give you C11 plus POSIX plus GNU extensions.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">--Elad</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed., Aug. 17, 2022, 11:18 a.m. Akir=
a Yokosawa, &lt;<a href=3D"mailto:akiyks@gmail.com">akiyks@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Elad,<br>
<br>
On Wed, 17 Aug 2022 07:00:50 -0400, Elad Lahav wrote:<br>
&gt; Signed-off-by: Elad Lahav &lt;<a href=3D"mailto:e2lahav@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">e2lahav@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
As there is no changelog here, let me ask a (maybe stupid) question.<br>
<br>
What is your goal of diverting from GCC extensions and switching<br>
to the C11 standard?<br>
<br>
Do you want the codebase under CodeSamples/ to be strictly<br>
conformant to C11 or later?<br>
<br>
Runnig &quot;make&quot; under CodeSamples/count, with &quot;-std=3Dc11&quot=
; appended<br>
to GCC_ARGS, I get a lot of compile errors/warnings (with GCC 9.4.0<br>
under Ubuntu 20.04), beginning with:<br>
<br>
=C2=A0 =C2=A0 cc -g -O2 -Wall -std=3Dc11=C2=A0 -o count_atomic count_atomic=
.c -lpthread<br>
<br>
=C2=A0 =C2=A0 In file included from /usr/include/sched.h:34,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from /usr/include/pthread.h:22,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from ../api.h:159,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from count_atomic.c:22:<br>
<br>
=C2=A0 =C2=A0 /usr/include/time.h:113:5: error: unknown type name &#39;loca=
le_t&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 113 |=C2=A0 =C2=A0 =C2=A0locale_t __loc) __THROW;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~~~~~<br>
<br>
<br>
A workaround is to append &quot;-D_GNU_SOURCE&quot; to GCC_ARGS.=C2=A0 With=
 that,<br>
I get the next warning of:<br>
<br>
=C2=A0 =C2=A0 ../api.h:766:2: warning: implicit declaration of function &#3=
9;typeof&#39; [-Wimplicit-function-declaration]<br>
<br>
=C2=A0 766 |=C2=A0 typeof(*ptr) _____actual =3D (o); \<br>
<br>
<br>
Apparently, typeof() is another GCC extension.=C2=A0 __typeof__() might<br>
be used instead, but it is not ISO C.<br>
<br>
So what is you goal of these switches?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanks, Akira<br>
<br>
&gt;=C2=A0 CodeSamples/count/count_end.c | 12 ++++++------<br>
&gt;=C2=A0 count/count.tex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 20 ++++++++++++--------<br>
&gt;=C2=A0 2 files changed, 18 insertions(+), 14 deletions(-)<br>
&gt; <br>
[...]<br>
</blockquote></div>

--000000000000a301d205e6734f85--

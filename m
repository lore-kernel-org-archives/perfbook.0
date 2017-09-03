Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38097 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752827AbdICDGW (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 2
 Sep 2017 23:06:22 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v833665o127226
 for <perfbook@vger.kernel.org>; Sat, 2 Sep 2017 23:06:21 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cqrt7t5ay-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 02 Sep 2017 23:06:21 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 2 Sep 2017
 23:06:19 -0400
Date: Sat, 2 Sep 2017 20:06:18 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Other-multicopy atomicity
Reply-To: paulmck@linux.vnet.ibm.com
References: <a5f7959b-cfe3-9bc3-3f65-7b1f9577ad99@gmail.com>
 <20170903005744.GK19872@linux.vnet.ibm.com>
 <182931cd-d656-217d-c72d-c3599ec3d32f@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <182931cd-d656-217d-c72d-c3599ec3d32f@gmail.com>
Message-Id: <20170903030618.GC15437@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 03, 2017 at 11:02:55AM +0900, Akira Yokosawa wrote:
> On 2017/09/02 17:57:44 -0700, Paul E. McKenney wrote:
> > On Sat, Sep 02, 2017 at 01:09:37PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> I have a comment on the term "other-multicompy atomicity".
> >>
> >> It took a while for me to realize that the "other-" stands for "other =
than self CPU".
> >> At first, it sounded like "other type of multicompy atomicity", which =
looked
> >> quite vague.
> >>
> >> Commit 43236beadb1 ("memorder: Expand on cumulativity and {other,} mul=
ticopy
> >> atomicity") helped me to realize your intention. May I suggest to add =
a footnote
> >> on the use of "other-"?
> >=20
> > I am trying to do a bit too much with that paragraph, aren't I?
> >=20
> > How about the patch below?
>=20
> Please see the comments below.
>=20
> >=20
> >> Also, you failed to replace tabs to white spaces in listing added in t=
he
> >> above mentioned commit.
> >=20
> > Good eyes, fixed!  (Not yet pushed, will get there.)
> >=20
> > 							Thanx, Paul
> >=20
> > ------------------------------------------------------------------------
> >=20
> > commit 87b29716cee78c5505039ba933c2f991ed3b1dec
> > Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Date:   Sat Sep 2 17:48:39 2017 -0700
> >=20
> >     memorder: Clarify other-multicopy atomicity
> >=20=20=20=20=20
> >     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >=20
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 62544ae8ed52..90e2b5e2f294 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -1703,32 +1703,32 @@ and other counterintuitive behavior, as discuss=
ed in the next section.
> >=20=20
> >  Threads running on a \emph{multicopy atomic}~\cite{Stone:1995:SP:62326=
2.623912}
> >  platform are guaranteed
> > -to agree on the order of writes, even to different variables.
> > +to agree on the order of stores, even to different variables.
> >  A useful mental model of such a system is the single-bus architecture
> >  shown in
> >  Figure~\ref{fig:memorder:Global System Bus And Multi-Copy Atomicity}.
> > -If each write resulted in a message on the bus, and if the bus could
> > -accommodate only one write at a time, then any pair of CPUs would
> > -agree on the order of all writes that they observed.
> > +If each store resulted in a message on the bus, and if the bus could
> > +accommodate only one store at a time, then any pair of CPUs would
> > +agree on the order of all stores that they observed.
> >  Unfortunately, building a computer system as shown in the figure,
> >  without store buffers or even caches, would result in glacial computat=
ion.
> > -CPU vendors have therefore taken one of three approaches:
> > -(1)~Provide store buffers, caches, and the rest and abandon
> > -multicopy atomicity (weakly ordered platforms),
> > -(2)~Provide all those hardware optimizations, and invest many transist=
ors
> > -into preserving multicopy atomicity (TSO platforms), or
> > -(3)~Define a slightly weaker \emph{other-multicopy atomicity} that all=
ows
> > -a given CPU's stores to become visible to that CPU before they become =
visible
> > -to other CPUs, but in which each of those stores becomes visible to all
> > -the other CPUs simultaneously~\cite{ARMv8A:2017}.
> > -Perhaps there will come a day when all platforms provide some flavor
> > -of multi-copy atomicity, but
> > -in the meantime, non-multicopy-atomic platforms do exist, and so softw=
are
> > -does need to deal with them.
> > +CPU vendors interested in providing multicopy atomicity have therefore
> > +instead provided the slightly weaker
> > +\emph{other-multicopy atomicity}~\cite{ARMv8A:2017},
>=20
> On the ARMv8 multicopy atomicity, I found a paper "Simplifying ARM Concur=
rency:
> Multicopy-atomic Axiomatic and Operational Models for ARMv8" at
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.cl.cam.ac.uk_-7=
Epes20_armv8-2Dmca_armv8-2Dmca-2Ddraft.pdf&d=3DDwICaQ&c=3Djf_iaSHvJObTbx-si=
A1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3D1JFkyKvDbZmHr-CRb=
zC5HuCgZZCSnpvTioqYoFTfMog&s=3DBdlEGULkAzO_ibDzx4a3IT6_-zC815dPjOwJa9qPLLo&=
e=3D  (Draft, July 12, 2017)
> by Christopher Pulte, et.al. It is a draft, but could also be cited here.
> As you know, "ARM ARM" is quite a large document. If you specified where =
to look
> in the manual, it would be even better.

Section B2.3, which I have now included in the citation.  Please see
below for updated patch.

> > +which excludes the CPU doing a given store from the requirement that a=
ll
> > +CPUs agree on the order of all stores.
> > +This means that if only a subset of CPUs are doing stores, the
> > +other CPUs will agree on the order of stores, hence the ``other''
> > +in ``other-multicopy atomicity''.
>=20
> Yes, now the meaning of "other-" is clear enough.

Glad it helped!

							Thanx, Paul

------------------------------------------------------------------------

commit 8223c00857dca7eef47015744b77c126d0c8626e
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Sat Sep 2 17:48:39 2017 -0700

    memorder: Clarify other-multicopy atomicity
=20=20=20=20
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 62544ae8ed52..1d4256d76e7a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1703,32 +1703,32 @@ and other counterintuitive behavior, as discussed i=
n the next section.
=20
 Threads running on a \emph{multicopy atomic}~\cite{Stone:1995:SP:623262.62=
3912}
 platform are guaranteed
-to agree on the order of writes, even to different variables.
+to agree on the order of stores, even to different variables.
 A useful mental model of such a system is the single-bus architecture
 shown in
 Figure~\ref{fig:memorder:Global System Bus And Multi-Copy Atomicity}.
-If each write resulted in a message on the bus, and if the bus could
-accommodate only one write at a time, then any pair of CPUs would
-agree on the order of all writes that they observed.
+If each store resulted in a message on the bus, and if the bus could
+accommodate only one store at a time, then any pair of CPUs would
+agree on the order of all stores that they observed.
 Unfortunately, building a computer system as shown in the figure,
 without store buffers or even caches, would result in glacial computation.
-CPU vendors have therefore taken one of three approaches:
-(1)~Provide store buffers, caches, and the rest and abandon
-multicopy atomicity (weakly ordered platforms),
-(2)~Provide all those hardware optimizations, and invest many transistors
-into preserving multicopy atomicity (TSO platforms), or
-(3)~Define a slightly weaker \emph{other-multicopy atomicity} that allows
-a given CPU's stores to become visible to that CPU before they become visi=
ble
-to other CPUs, but in which each of those stores becomes visible to all
-the other CPUs simultaneously~\cite{ARMv8A:2017}.
-Perhaps there will come a day when all platforms provide some flavor
-of multi-copy atomicity, but
-in the meantime, non-multicopy-atomic platforms do exist, and so software
-does need to deal with them.
+CPU vendors interested in providing multicopy atomicity have therefore
+instead provided the slightly weaker
+\emph{other-multicopy atomicity}~\cite[Section B2.3]{ARMv8A:2017},
+which excludes the CPU doing a given store from the requirement that all
+CPUs agree on the order of all stores.
+This means that if only a subset of CPUs are doing stores, the
+other CPUs will agree on the order of stores, hence the ``other''
+in ``other-multicopy atomicity''.
+Unlike multicopy-atomic platforms, within other-multicopy-atomic platforms,
+the CPU doing the store is permitted to observe its
+store early, which allows its later loads to obtain the newly stored
+value directly from the store buffer.
+This in turn improves performance.
=20
 \QuickQuiz{}
 	Can you give a specific example showing different behavior for
-	multicopy atomic on the one hand and other multicopy atomic
+	multicopy atomic on the one hand and other-multicopy atomic
 	on the other?
 \QuickQuizAnswer{
 \begin{listing}[tbp]
@@ -1790,6 +1790,12 @@ exists (1:r1=3D1 /\ 1:r2=3D0)
 	which in turn allows the \co{exists} clause to trigger.
 } \QuickQuizEnd
=20
+
+Perhaps there will come a day when all platforms provide some flavor
+of multi-copy atomicity, but
+in the meantime, non-multicopy-atomic platforms do exist, and so software
+does need to deal with them.
+
 \begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DQ7EVeNleJycyxaIDU8z=
rQ-TvAloij0JpWYOZrXIKx4c&s=3DetV_KUVGGzv0WanXWYzQHz5KX51L3c3orpwBfwRCyvY&e=
=3D=20


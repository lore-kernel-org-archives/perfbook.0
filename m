Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e36.co.us.ibm.com ([32.97.110.154]:38645 "EHLO
 e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751183AbbEKNUW (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 11 May 2015
 09:20:22 -0400
Received: from /spool/local	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 11 May
 2015 07:20:22 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id 65E111FF001E	for <perfbook@vger.kernel.org>; Mon, 11
 May 2015 07:11:30 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t4BDKKsk36307130	for <perfbook@vger.kernel.org>; Mon, 11 May 2015 06:20:20
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t4BDKJlg019896	for <perfbook@vger.kernel.org>; Mon, 11 May 2015 07:20:19
 -0600
Date: Mon, 11 May 2015 06:20:18 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: About Figure 6.5 Chapter 6 (v 31.01.2015)
Message-ID: <20150511132018.GG6776@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAOTdtQztEd=AqfA0jFmvGvVvVmuF9qv66LtgSF85AYB95SreUA@mail.gmail.com>
 <CAOTdtQy3tyBm1uzQgfhacGrNc78VwVHVvc_W=er83Cr_CW+=cw@mail.gmail.com>
 <20150510204947.GD6776@linux.vnet.ibm.com>
 <CAOTdtQyGfwcSM3dL0bgeLctZ8R-Jz31Z6p00seVd_e190oe3=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CAOTdtQyGfwcSM3dL0bgeLctZ8R-Jz31Z6p00seVd_e190oe3=g@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Jose Fernando Santos de Carvalho <jfsc@cin.ufpe.br>
Cc: perfbook@vger.kernel.org

On Sun, May 10, 2015 at 09:42:53PM -0300, Jose Fernando Santos de Carvalho =
wrote:
> Dear Paul,
> thank you for feedback. FYI, we are using perfbook as a main reference
> in our discipline.

Hello, Jose,

That is very good to hear, and thank you for letting me know!

								Thanx, Paul

> best regards.
>=20
>=20
> On Sun, May 10, 2015 at 5:49 PM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Sat, May 09, 2015 at 12:01:01PM -0300, Jose Fernando Santos de Carva=
lho wrote:
> >> Link: http://ustore1.rnp.br/ustore/faces/publicFile.xhtml?code=3D35e4c=
269403136c4a9fdb9227b704409
> >>
> >> On Tue, May 5, 2015 at 11:40 PM, Jose Fernando Santos de Carvalho
> >> <jfsc@cin.ufpe.br> wrote:
> >> > Dear all,
> >> >
> >> > while writing chapter 6 (Partitioning and Synchronisation Design), P=
aul has
> >> > presented five special cases about Left - and Right-Hand Locks(Figur=
e 6.5).
> >> > However, it is not clear for me the possible problem in the fourth c=
ase
> >> > (link).
> >> >
> >> >
> >> > If possible, could anyone send some feedback about it?
> >> >
> >> > Link:
> >> > http://ustore1.rnp.br/ustore/faces/publicFile.xhtml?code=3D35e4c2694=
03136c4a9fdb9227b704409--
> >> >
> >> > --
> >> > Jose Fernando
> >
> > Hello, Jose,
> >
> > You could indeed claim that the second-to-last row is safe because the =
two
> > ends will be operating on different pointers for element 1.  Neverthele=
ss,
> > the fact remains that both ends need to operate on element 1 simultaneo=
usly,
> > which should give us pause.  Especially given that we are in a concurre=
nt
> > environment.
> >
> > For example, suppose that thread A holds the left-hand lock and wants to
> > remove element 0.  While thread A is comtemplating doing this, some oth=
er
> > thread B might hold the right-hand lock and remove element 2.  We are n=
ow
> > in the state shown in the third row, and thus completely unsafe.
> >
> >                                                         Thanx, Paul
> >
>=20
>=20
>=20
> --=20
> --=20
> Jos=E9 Fernando Carvalho
> DSc Candidate in Computer Science
> Federal University of Pernambuco (UFPE) - Brazil
>=20


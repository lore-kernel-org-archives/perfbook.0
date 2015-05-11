Return-Path: <jfsc@cin.ufpe.br>
MIME-Version: 1.0
In-Reply-To: <20150510204947.GD6776@linux.vnet.ibm.com>
References: 
 <CAOTdtQztEd=AqfA0jFmvGvVvVmuF9qv66LtgSF85AYB95SreUA@mail.gmail.com>
 <CAOTdtQy3tyBm1uzQgfhacGrNc78VwVHVvc_W=er83Cr_CW+=cw@mail.gmail.com>
 <20150510204947.GD6776@linux.vnet.ibm.com>
Date: Sun, 10 May 2015 21:42:53 -0300
Message-ID: 
 <CAOTdtQyGfwcSM3dL0bgeLctZ8R-Jz31Z6p00seVd_e190oe3=g@mail.gmail.com>
Subject: Re: About Figure 6.5 Chapter 6 (v 31.01.2015)
From: Jose Fernando Santos de Carvalho <jfsc@cin.ufpe.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Dear Paul,
thank you for feedback. FYI, we are using perfbook as a main reference
in our discipline.

best regards.


On Sun, May 10, 2015 at 5:49 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Sat, May 09, 2015 at 12:01:01PM -0300, Jose Fernando Santos de Carvalh=
o wrote:
>> Link: http://ustore1.rnp.br/ustore/faces/publicFile.xhtml?code=3D35e4c26=
9403136c4a9fdb9227b704409
>>
>> On Tue, May 5, 2015 at 11:40 PM, Jose Fernando Santos de Carvalho
>> <jfsc@cin.ufpe.br> wrote:
>> > Dear all,
>> >
>> > while writing chapter 6 (Partitioning and Synchronisation Design), Pau=
l has
>> > presented five special cases about Left - and Right-Hand Locks(Figure =
6.5).
>> > However, it is not clear for me the possible problem in the fourth cas=
e
>> > (link).
>> >
>> >
>> > If possible, could anyone send some feedback about it?
>> >
>> > Link:
>> > http://ustore1.rnp.br/ustore/faces/publicFile.xhtml?code=3D35e4c269403=
136c4a9fdb9227b704409--
>> >
>> > --
>> > Jose Fernando
>
> Hello, Jose,
>
> You could indeed claim that the second-to-last row is safe because the tw=
o
> ends will be operating on different pointers for element 1.  Nevertheless=
,
> the fact remains that both ends need to operate on element 1 simultaneous=
ly,
> which should give us pause.  Especially given that we are in a concurrent
> environment.
>
> For example, suppose that thread A holds the left-hand lock and wants to
> remove element 0.  While thread A is comtemplating doing this, some other
> thread B might hold the right-hand lock and remove element 2.  We are now
> in the state shown in the third row, and thus completely unsafe.
>
>                                                         Thanx, Paul
>



--=20
--=20
Jos=C3=A9 Fernando Carvalho
DSc Candidate in Computer Science
Federal University of Pernambuco (UFPE) - Brazil


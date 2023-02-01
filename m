Return-Path: <SRS0=2WLy=55=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=50kAHy+KjrmB8sQRa2hMqZcdYYZ0SKYBqiQIrKz7OYg=;
        b=F821x0JmKnkGKo2/DbfMLBgU8bTdH+4/FAYRP8y7rKxKn99zIMLw0TMyU+xY4PssYf
         pFNVpJFHYk5GDNo2ESDLqeGv63aJqzCzMfM0ZlIt4sQbqu0Uz07/EcObELWsaNjOCVYn
         97kMOrTy/lgt4VjbtnM3jLYFTC0iGfaTJm6/UUbTt64yTMDLAxaAuevNP2INeScmxh3z
         EWDMKT5htSdjKVzdr2bFS3Dxt3k7daTIK9ZxDF7Bj8MRED96R0PvBU+bAv/HVgvIOxPr
         6OJEalV4mQVibOewqrdkhPDlMRruwr/3/nFiyOcnjqrzni8RdN0nt4Dpun/nNPcj3SfQ
         ny6g==
Message-ID: <8b74b3002d65c3e2db6c2fa3a1b00564998ad4b2.camel@gmail.com>
Subject: Re: Perfbook : Thanks!
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Wed, 01 Feb 2023 17:29:20 -0300
In-Reply-To: <20230201142318.GD2948950@paulmck-ThinkPad-P17-Gen-1>
References: <d49bc621da6f74e33cd41d5fc3d1e9ed17cba3bd.camel@gmail.com>
	 <20230131214528.GY2948950@paulmck-ThinkPad-P17-Gen-1>
	 <9718eb1362cd216f680694ff737360a2eb875cc5.camel@gmail.com>
	 <20230201041534.GB2948950@paulmck-ThinkPad-P17-Gen-1>
	 <093f3237c3dbfe0daa8a35040dcd5c114be153bb.camel@gmail.com>
	 <20230201142318.GD2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, perfbook@vger.kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, 2023-02-01 at 06:23 -0800, Paul E. McKenney wrote:
> On Wed, Feb 01, 2023 at 01:21:05AM -0300, Leonardo Br=C3=A1s wrote:
> > On Tue, 2023-01-31 at 20:15 -0800, Paul E. McKenney wrote:
> > > On Tue, Jan 31, 2023 at 11:19:02PM -0300, Leonardo Br=C3=A1s wrote:
> > > > Hello Paul,
> > > >=20
> > > > On Tue, 2023-01-31 at 13:45 -0800, Paul E. McKenney wrote:
> > > > > On Tue, Jan 31, 2023 at 06:09:50PM -0300, Leonardo Br=C3=A1s wrot=
e:
> > > > > > Hello Paul,
> > > > > >=20
> > > > > > I am a newbie Kernel Developer, and I was already a fan of your=
 work on memory-
> > > > > > barriers.txt.=C2=A0
> > > > > >=20
> > > > > > A couple weeks ago a friend of mine recommended reading perfboo=
k,=C2=A0and sent me an
> > > > > > older version (2011.01.02a). After reading a few pages I went o=
n and found that
> > > > > > the book had newer releases and is often updated and maintained=
 with git, which
> > > > > > got me really impressed.
> > > > > >=20
> > > > > > (I had a lot of work gone to waste on other books I found error=
s on, and
> > > > > > perfbook's git workflow just make a lot of sense to me)
> > > > > >=20
> > > > > > Since it's a topic I am really interested in, and I noticed the=
 book has updates
> > > > > > from a couple days ago, I decided to install texinfo packages a=
nd compile a new
> > > > > > version for me to start reading.=C2=A0
> > > > > >=20
> > > > > > I then noticed it would be nice to keep reading the latest vers=
ion whenever an
> > > > > > update came by, so I created a gitlab-ci to re-generate the boo=
k after a new
> > > > > > commit / push: https://gitlab.com/linux-kernel/perfbook
> > > > > >=20
> > > > > > Is that ok if I keep this gitlab repository re-generating the b=
ook?
> > > > > >=20
> > > > > > Is a gitlab-ci of any use for you?
> > > > > > If so, I can send it as a patch (a single .gitlab-ci.yaml file)=
, and refine it
> > > > > > according to your needs.
> > > > > >=20
> > > > > > Thanks for keeping the book updated!
> > > > >=20
> > > > > Hello, Leonardo, and glad you like the book!
> > > > >=20
> > > > > On the automated CI, I cant't think of a problems with it.  In fa=
ct, in
> > > > > my experience, automated testing is usually a good thing.  I am a=
dding
> > > > > the perfbook email list in case others have advice or other guida=
nce.
> > > > >=20
> > > > > Just out of curiosty, are you thinking of automating tests of the
> > > > > sample code as well as of the LaTeX builds?
> > > >=20
> > > > For now it only automates the LaTeX build of perfbook.pdf, perfbook=
-1c.pdf and
> > > > perfbook-eb.pdf, but there should be no problem automating tests to=
o. (I mean,
> > > > once I understand how to run tests.)
> > >=20
> > > Good point, building the tests should be a matter of "cd CodeSamples;
> > > make", but yes, the actual running of the tests is at the moment a ma=
tter
> > > of a bunch of random .sh scripts.  I will think about the feasibility
> > > or not of adding something like "make check" to those directories.
> > >=20
> > > 							Thanx, Paul
> >=20
> > That would be much easier to test!
> >=20
> > Whenever you have a desired testing procedure to run, please let me kno=
w so I
> > can add to the Gitlab-CI.
>=20
> It is on my list, thank you!
>=20
> In the meantime, simple build testing of the code samples would be of
> value.
>=20
> 							Thanx, Paul

Done!
I just sent a patch on the list. It assumes the CodeSample test will come b=
efore
the PDF building.

Please let me know if I got anything wrong.

Best regards,
Leo

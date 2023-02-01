Return-Path: <SRS0=2WLy=55=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FdGbxiuMgXd5e+vYrpkMYt3GUcdtdX+K7veAIhxyFnE=;
        b=Nskss6fimv60Tx9K6s11QYXbQIMqa7HdZJ2daDw9OitIJqs4+wfOG73PUgZFnuWYx+
         hWCB/ZF6uuPJjZuIJ6a9iTOQdVhtBeA89Q/AUjAPkZu/tv13uofm93eVjEoFToUJgb8B
         HRlaAPJSK34qETy2suELONxaoZMrmk0cK+R4NXad1V8AWhuQvGohi+7HL4a2TiK81+o/
         xDbssHUa5+cI243VrlRtLoJfPdEPpDLrH/815Ie1hhdOyOU7H2zgXOZGQ1Lu/21/fqsc
         D/CKt9ZFNr+8g2eJw7dJqdqgnjd3LRxZ/eq2JgrBEAmqWnGV981H2LEbaWcspCG9VNd9
         7m3A==
Message-ID: <9718eb1362cd216f680694ff737360a2eb875cc5.camel@gmail.com>
Subject: Re: Perfbook : Thanks!
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Tue, 31 Jan 2023 23:19:02 -0300
In-Reply-To: <20230131214528.GY2948950@paulmck-ThinkPad-P17-Gen-1>
References: <d49bc621da6f74e33cd41d5fc3d1e9ed17cba3bd.camel@gmail.com>
	 <20230131214528.GY2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello Paul,

On Tue, 2023-01-31 at 13:45 -0800, Paul E. McKenney wrote:
> On Tue, Jan 31, 2023 at 06:09:50PM -0300, Leonardo Br=C3=A1s wrote:
> > Hello Paul,
> >=20
> > I am a newbie Kernel Developer, and I was already a fan of your work on=
 memory-
> > barriers.txt.=C2=A0
> >=20
> > A couple weeks ago a friend of mine recommended reading perfbook,=C2=A0=
and sent me an
> > older version (2011.01.02a). After reading a few pages I went on and fo=
und that
> > the book had newer releases and is often updated and maintained with gi=
t, which
> > got me really impressed.
> >=20
> > (I had a lot of work gone to waste on other books I found errors on, an=
d
> > perfbook's git workflow just make a lot of sense to me)
> >=20
> > Since it's a topic I am really interested in, and I noticed the book ha=
s updates
> > from a couple days ago, I decided to install texinfo packages and compi=
le a new
> > version for me to start reading.=C2=A0
> >=20
> > I then noticed it would be nice to keep reading the latest version when=
ever an
> > update came by, so I created a gitlab-ci to re-generate the book after =
a new
> > commit / push: https://gitlab.com/linux-kernel/perfbook
> >=20
> > Is that ok if I keep this gitlab repository re-generating the book?
> >=20
> > Is a gitlab-ci of any use for you?
> > If so, I can send it as a patch (a single .gitlab-ci.yaml file), and re=
fine it
> > according to your needs.
> >=20
> > Thanks for keeping the book updated!
>=20
> Hello, Leonardo, and glad you like the book!
>=20
> On the automated CI, I cant't think of a problems with it.  In fact, in
> my experience, automated testing is usually a good thing.  I am adding
> the perfbook email list in case others have advice or other guidance.
>=20
> Just out of curiosty, are you thinking of automating tests of the
> sample code as well as of the LaTeX builds?

For now it only automates the LaTeX build of perfbook.pdf, perfbook-1c.pdf =
and
perfbook-eb.pdf, but there should be no problem automating tests too. (I me=
an,
once I understand how to run tests.)


>=20
> 							Thanx, Paul

Thank you!
Leo

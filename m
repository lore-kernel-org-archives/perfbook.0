Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EOaOnlugmPvfOyhYqnwKjkeRbZmN9H/Q/fpA6rjO+Vc=;
 b=hBroFonMNIByL8nq4Mi7qbCsIHlUBaHVic/2Y3h8xHrjc1BJGPEBeRg6sQd0mgdww0
 AosOmAAF4u2erBtSIfbX7Pt43GeWvkte3NXwaZCgYx7FJJHDDOMbHqVNJFGyT62KmOsl
 KSgt8Heji76JPVlYnkEl+NJH/S2aXrN/GZPlwzE87Pr71gMsEZO6hVdQRWZ4dRbFUw4M
 A9+O8CIxKarXZ9jcK8wd0L6r857bpxtCCfXdohmQHXab3tt6V4NwjCu4o7KPdvjT6LV/
 1G1pYCwEm5Yfz1oR1+zo2VSp/Tqe15IN0HsNDcnwk+WaKJyB4pHehf9P7X6LNJtG1VlP
 hOFQ==
Content-Type: text/plain;	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/5] Bibliography update round 5
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20170208163747.GO30506@linux.vnet.ibm.com>
Date: Thu, 9 Feb 2017 05:57:23 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <78D82D63-A7BA-4F43-B320-679D6EA44FD8@gmail.com>
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
 <20170208163747.GO30506@linux.vnet.ibm.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>



> On Feb 9, 2017, at 1:37, Paul E. McKenney <paulmck@linux.vnet.ibm.com> wro=
te:
>=20
> On Wed, Feb 08, 2017 at 11:54:41PM +0900, Akira Yokosawa wrote:
>>> =46rom 58a0655ab2b5c555bd19a6d7624a9d4413cf1360 Mon Sep 17 00:00:00 2001=

>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 8 Feb 2017 23:34:47 +0900
>> Subject: [PATCH 0/5] Bibliography update round 5
>>=20
>> Hi Paul,
>>=20
>> Here is round 5 of bibliography updates.
>> Patches 1, 2, and 3 take care of broken urls. Patch 2 contains an
>> alternative link to a webpage capture.
>> Patch 4 is cosmetic fix of UCB in author fields
>> Patch 5 is a different type of update. It adds awareness of "location"
>> field in "inproceedings" entry. Please see the commit log for details.
>> I think this is a reasonable change for perfbook.
>=20
> I applied the first four, and might be convinced to apply the fifth.
> But first a question -- how many changes would be required to bring
> my old bib entries in line with current practice?

No change is required. Because this change has effect
only on entries with both "address" and "location".
I thought I explained this somewhere, but missed to do so.
Can this clarification convince you?

Thanks, Akira=E2=80=82
(from mobile, might be QP encoded)

>  That might be the
> best approach longer term.  Depending of course on how difficult it
> is to locate them all...
>=20
>                            Thanx, Paul
>=20
>>                                             Thanks, Akira
>> --
>> Akira Yokosawa (5):
>>  bib/maze: Mark url of ETHZurich:FS2011maze as broken link
>>  bib/syncrefs: Mark url of DougLocke2002a as broken
>>  bib/syncrefs: Mark url of Victor2002a as broken
>>  bib/parallelsys: Properly format UCB in author field
>>  alphapf.bst: Make use of 'location' field in 'inproceedings' entry
>>=20
>> alphapf.bst         | 47 +++++++++++++++++++++++++++++++++--------------
>> bib/maze.bib        |  4 +++-
>> bib/parallelsys.bib |  4 ++--
>> bib/syncrefs.bib    | 14 ++++++++------
>> 4 files changed, 46 insertions(+), 23 deletions(-)
>>=20
>> --=20
>> 2.7.4
>>=20
>=20


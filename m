Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:39393 "EHLO
 mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751429AbdKVBCU (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 21
 Nov 2017 20:02:20 -0500
Received: by mail-pf0-f195.google.com with SMTP id l24so11160818pfj.6 for
 <perfbook@vger.kernel.org>; Tue, 21 Nov 2017 17:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cR8yHAC6FxCYFqb9gyIYPC//wyVG0aIJ7bqHHGtpYSM=;
 b=hz/jSJQDh5Ijpn7Mogt6FksLGZL6sUPx5orm95c6sFW9P2WWM3CG86Hknou7O1WGhc
 cExtuf2v/3DknlUEefE1TLrp492YOwIhoZLDOXFmy5gNzp9oEh/usNrd5oNCt6cnf/Yb
 8m6NMFKUyHbIN6bAAc7Q5uufkJzZdq+rEemk/TIk7cH7FplVnjRrdLukiqOETh4Ea4H2
 bQd2hcgMLu631cExKvfq2a2psVF19PFOLLVT7sOqDxa4A8cTMl7vtSUwJ9qxpeLeqH0Q
 DzkPlEJiKRIStfXMBEq695pIolKS9zGEO3XvmdDFvETfwkXXvgKCQMaKVAJHgCwaN3kE
 NxUg==
Content-Type: text/plain;        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/2] Add Makefile in CodeSamples/formal/herd
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20171122001231.GP3624@linux.vnet.ibm.com>
Date: Wed, 22 Nov 2017 10:02:16 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <3840ADCE-66F6-417D-B3B6-22BBE87E85E4@gmail.com>
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
 <20171122001231.GP3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>




2017/11/22 9:12 +0900=E3=80=81Paul E. McKenney <paulmck@linux.vnet.ibm.com> w=
rote:

> On Wed, Nov 22, 2017 at 12:34:08AM +0900, Akira Yokosawa wrote:
>>> =46rom 180abe9a72d4e3fbe200ce2a032a6c616a70ce03 Mon Sep 17 00:00:00 2001=

>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 22 Nov 2017 00:04:40 +0900
>> Subject: [PATCH 0/2] Add Makefile in CodeSamples/formal/herd
>>=20
>> (Resending with To: Paul)
>> Hi Paul,
>>=20
>> This is my attempt to add Makefile in CodeSamples/formal/herd.
>> The recipes here assumes that the memory-model's repository resides
>> beside the perfbook's repository on your machine.
>>=20
>> The targets include conversion of litmus7 compatible tests under
>> litmus/ directory to herd7/klitmus7 compatible ones,
>> running converted litmus tests by herd7,
>> running herd7 benchmark tests by herd7,
>> and preparing directory for klitmus7 cross-compile of converted
>> tests.
>>=20
>> Currently, there is no test other than benchmarks under herd/
>> directory which is not compatible with litmus7. When such tests
>> are added there, the Makefile can be updated to run and cross-compile
>> them along with the converted tests.
>>=20
>> Patch #1 adds the Makefile and a helper script.
>>=20
>> Patch #2 is a fix of compiler warnings revealed in klitmus7 cross-
>> compiling.
>> These C-WWC-o+o-* litmus tests were modified by me in this August.
>> That looked sufficient for litmus7, but definitions in kernel header
>> files used in klitmus7 aren't satisfied. The change here is the result
>> of some try-and-errors. There can be smarter way to describe these tests.=

>> They are not used in the text at the moment, so their fix is not
>> urgent, I suppose.
>=20
> I queued these, but let's talk about the memory model.  Currently,
> it is available in this git archive:
>=20
>    https://github.com/aparri/memory-model.git
>=20
> Specifically, these files:
>=20
>    linux-kernel.bell
>    linux-kernel.cat
>    linux-kernel.cfg
>    linux-kernel.def
>    linux-kernel-hardware.cat
>    lock.cat
>=20
> We hope to get these upstream into the Linux kernel during the next
> merge window.  So maybe the right thing to do is to require that the
> user copy the files into the formal/herd directory, and have Makefile
> give instructions and stop if they are not present.
>=20
> Thoughts?

I=E2=80=99m kind of against having those untracked files there.
The directory where they reside can be specified by
overriding LKMM_DIR variable in the Makefile by an option to make command.
So change of the location of memory model won=E2=80=99t be a problem.

But yes, the check of the existence of the directory can help users. I=E2=80=
=99ll see what l can do.

Thoughts?

Akira=E2=80=82
(from mobile, might be QP encoded)

>=20
>                            Thanx, Paul
>=20
>>        Thanks, Akira
>> --
>> Akira Yokosawa (2):
>>  CodeSamples/formal/herd: Add Makefile and utility script
>>  CodeSamples/formal/litmus: Fix type of 2:r2 in C-WWC+o+o-*.litmus test
>>=20
>> CodeSamples/formal/herd/.gitignore                 |  4 ++
>> CodeSamples/formal/herd/Makefile                   | 60 +++++++++++++++++=
+++++
>> CodeSamples/formal/herd/litmus2herd.sh             | 20 ++++++++
>> .../formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus |  9 ++--
>> .../formal/litmus/C-WWC+o+o-r+o-addr-o.litmus      |  9 ++--
>> 5 files changed, 92 insertions(+), 10 deletions(-)
>> create mode 100644 CodeSamples/formal/herd/.gitignore
>> create mode 100644 CodeSamples/formal/herd/Makefile
>> create mode 100644 CodeSamples/formal/herd/litmus2herd.sh
>>=20
>> --=20
>> 2.7.4
>>=20
>> --
>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>=20
>=20

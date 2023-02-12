Return-Path: <SRS0=sCbS=6I=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzTEzODWlcAwinm8oahdnNW6Bg0LKkBgkvPeg1/n9Xw=;
        b=LsXj18eR4YrOAbi8tYnF/uAQ80MyPwg8+sN5pY2CUDSi+Vlka3O5AnmR6dlfhPcMSh
         hOyyXtgMOZKzUJhnHO6QC2vy88hrqL6rhzOO0+821wq32rTjYuAJfw/HL75goSaZxsu4
         m6qtatAc/i23jUrkZpBXGOcyvzCDWoWG/4q8oTcQw2mBWPqxUOgTZXyOvZ9qoXzYvuOV
         53MGxX6KfG1pi38rDb56UksGaV5Co3Ht83W6BOQN+VXOvE40dY7Xx2gWOtjdB9R0ZmJQ
         jMTNxyBTI+yKTuSGxYkfF6FnT0eC6cwi5WE0WSjL0xTTFLkD/6BTugOSiM3fFEarhgic
         PcAQ==
Message-ID: <4db38110-2046-78b3-d311-a008cc5ab556@gmail.com>
Date: Sun, 12 Feb 2023 09:04:00 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook] cpu: PoC of A QQz citing table in answer to
 another QQz (was Re: Question about Table E.1)
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
 <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
 <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
 <20230208221522.GK2948950@paulmck-ThinkPad-P17-Gen-1>
 <89b46523-75e2-d740-e6d5-add44b6c5591@gmail.com>
 <8506fddb-f188-2a4f-8315-4a8d56928f31@gmail.com>
 <f1e6d9a6-c2cc-9b3a-43c0-26ff8760b294@gmail.com>
 <c7e120f78b29239f4de6c88004318c3c9f825e10.camel@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c7e120f78b29239f4de6c88004318c3c9f825e10.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 11 Feb 2023 05:49:49 -0300, Leonardo Br=C3=A1s wrote:
> On Fri, 2023-02-10 at 00:12 +0900, Akira Yokosawa wrote:
>> Subject: [PATCH -perfbook] cpu: Add a QQz citing table E.1
>>
>> An email thread started from a question from Leo [1] stimulated
>> me to add a QQz on Paul's experience back in 2009.
>>
>> Link: [1] https://www.spinics.net/lists/perfbook/msg03824.html
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> I wrote:
>>> On second thought, it should be possible to put a QQz next to QQz 3.7=

>>> citing Table E.1 in the Quiz part.
>>>
>>> Let me try and produce a PoC patch.
>>
>> Something like this?
>>
>> I couldn't make the QQz next to QQz 3.7 due to the
>>
>>   \QuickQuizLabel{\QspeedOfLightAtoms}
>>
>> just below QQz 3.7.
>> If you put the label in the middle of
>>
>> \QuickQuizSeries{
>>  ...
>> }
>>
>> , you will get build errors in -nq builds.=20
>>
>> Instead, I added it next to QQz 3.8 (or the end of Section 3.2.2).
>> It looks still relevant there.
>>
>> The wording of the Quiz and its Answer is just a stub.
>> Paul, feel free to rewrite them as you like.
>>
>>         Thanks, Akira
>> --
>>  cpu/overheads.tex | 24 +++++++++++++++++++++---
>>  1 file changed, 21 insertions(+), 3 deletions(-)
>>
=2E..
>=20
> Tested on Gitlab:
> https://gitlab.com/linux-kernel/perfbook/-/pipelines/774642106

Thank you for testing!

>=20
> Observations for this PDF:
> QQz 3.7 has the mentioned table.
> QQz 3.9 has the comment on the table.
> 'Question + link' to QQz 3.9 appears in Chapter 3, on the page after 'q=
uestion +
> link' to QQz 3.7.
>=20
> Is that the desired output?
>=20
> (It feels a little 'misplaced', TBH. The best place would be just after=
 QQz 3.7,
> but looking into your comments, it seems it was not possible.)

I think I have figured out the way for placing it next to QQz 3.7.

Will post a v2 after testing on my side.

        Thanks, Akira

>=20
>=20
> Anyway, if the desired output was achieved:
>=20
> Tested-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
>=20
>=20
> Best regards,
> Leo

Return-Path: <SRS0=s+nB=56=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eoem2cPw9x6yog+A4wbnDrUMDnjr1/SZE4RmMNXdG0E=;
        b=VvTrVR1wA1MmqLgVlpg12w37/DbIf7Z6J1PniMfxXdEG89uC1YdmZ5syyQuRNumCse
         fVn+h/gZIidBl6QMYZE91+RxZrZk2SondUVLKWO2haenqfj0QcEif34ICHNEoP/qUuV8
         Akv6WjZ7wTaKDoV8l6cXlFvtvGvn9HXO9PMe+SpDMSpHdvBz3BxxDWZwVzJkfhrrg10V
         /wlFK+Lvh+kdCb/gerbP+5Bd421FHKa8C5yFsW6qaejb36RqUg08LQaJSqvu7rjx4wns
         NLM/wgMeinndsAz2pyp0t/MLYXfYyiL0yTMUxxvC3Lt4To9CNAM61LyXZxNNxbOxcQCG
         9P+g==
Message-ID: <2b276f96-304c-39b4-e237-987ef7f7df2b@gmail.com>
Date: Fri, 3 Feb 2023 08:23:05 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
References: <20230201201529.901316-1-leobras.c@gmail.com>
 <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
 <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
 <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
 <ee2eb78d9575b53080a265c46775d01f0da37214.camel@gmail.com>
 <11517498-7fc9-2cd5-7cf8-6cb8705abf31@gmail.com>
 <203c05624258d0eecaae9717c25e9232ff450ee4.camel@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <203c05624258d0eecaae9717c25e9232ff450ee4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi,

On Thu, 02 Feb 2023 13:52:08 -0300, Leonardo Br=C3=A1s wrote:
> On Thu, 2023-02-02 at 23:42 +0900, Akira Yokosawa wrote:
>> On Thu, 02 Feb 2023 01:37:02 -0300, Leonardo Br=C3=A1s wrote:
>> [...]
>>>
>>> It looks like it can be done by "Running CI/CD for external repositor=
ies".
>=20
> Nah, it looks like this won't work either. After my patch on top of mas=
ter, it's
> already warning about diverging repositories when I try to sync.
>=20
> Another solution I could find:
> - Change the patch I sent before to keep the file on another directory,=
 even
> with a different name: this will not trigger the build for anyone.
> - Change my repository config to trigger the CI from that file.
>=20
> The file would only be a random YML file in the repo.
> Would that be ok?

Hmm, yes, I think I can live with it.

>=20
>>>
>>> I removed my previous repository and then imported perfbook again usi=
ng the
>>> above mentioned mode. According to the man page, it will run CI for t=
he project
>>> whenever a new push to the referenced repository happens.
>>>
>>> So it's just a matter of waiting a new commit getting push'ed to see =
if it will
>>> be working.
>>
>> Hi Leonardo,
>>
>> I noticed a minor glitch in the generated PDFs.
>> They don't have Git commit info in the title page and footer area of
>> pages.
>>
>> I can't tell what went wrong, but expected autodate.tex should look li=
ke:
>=20
> I found it out: gitlab was doing a shallow clone, and the previous tag =
was not
> in the commits, so I modified the Gitlab config so it does a complete c=
lone of
> the repository instead.

Aha!  The script has never tested under a shallow clone...
Let me see if I can improve its behavior.

> The last output of the pipeline seems to have been correct, please chec=
k:
> https://gitlab.com/linux-kernel/perfbook/-/jobs/3705185694/artifacts/br=
owse

Apparently, the commit id does not make sense in Paul's repo.
But the random YML file approach should resolve it.

        Thanks, Akira



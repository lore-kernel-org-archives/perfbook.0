Return-Path: <SRS0=s+nB=56=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIoK2pK5f7+8BYH0be7ap4BNbV/UzhMhjNAG0TdwYCo=;
        b=PE7lLFHxU0VXN+Fqw6vTU/qNPSKDhdDbdnYgGjoxdYb563pJ/oU77sriK3D7Ks5oIO
         MNDUP0/aMekwWoGen/US5YPWcnFqy8ww/XVcI7xrnnugRU+SFbyJ1vwkmPSfCCzKVXNq
         pkLscZawjE7Qn5OLXrUmHRjCI6v4DMbI1BhzVQglHXRUAG/I/MHNTovv7ef81gqFDvm7
         /71+2mYmKGPyLu2cXqdT1l8kR5/WUxcizX/a8Oi8zfIgAm5RKkGZ82qzGgt0ryUv/WP3
         A+HJtmLsxq4v/iaUH9A+2QLYXj4y+S+gIR5/6XJTooTOBvCTRki8Dy5WeuMJgQy+9+81
         OUZw==
Message-ID: <4ea57882-933b-431d-45bb-ca822679716a@gmail.com>
Date: Fri, 3 Feb 2023 08:51:04 +0900
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
 <2b276f96-304c-39b4-e237-987ef7f7df2b@gmail.com>
 <20230202233127.GA2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230202233127.GA2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: paulmck@kernel.org
Cc: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 2 Feb 2023 15:31:27 -0800, Paul E. McKenney wrote:
> On Fri, Feb 03, 2023 at 08:23:05AM +0900, Akira Yokosawa wrote:
>> Hi,
>>
>> On Thu, 02 Feb 2023 13:52:08 -0300, Leonardo Br=C3=A1s wrote:
>>> On Thu, 2023-02-02 at 23:42 +0900, Akira Yokosawa wrote:
>>>> On Thu, 02 Feb 2023 01:37:02 -0300, Leonardo Br=C3=A1s wrote:
>>>> [...]
>>>>>
>>>>> It looks like it can be done by "Running CI/CD for external reposit=
ories".
>>>
>>> Nah, it looks like this won't work either. After my patch on top of m=
aster, it's
>>> already warning about diverging repositories when I try to sync.
>>>
>>> Another solution I could find:
>>> - Change the patch I sent before to keep the file on another director=
y, even
>>> with a different name: this will not trigger the build for anyone.
>>> - Change my repository config to trigger the CI from that file.
>>>
>>> The file would only be a random YML file in the repo.
>>> Would that be ok?
>>
>> Hmm, yes, I think I can live with it.
>>
>>>
>>>>>
>>>>> I removed my previous repository and then imported perfbook again u=
sing the
>>>>> above mentioned mode. According to the man page, it will run CI for=
 the project
>>>>> whenever a new push to the referenced repository happens.
>>>>>
>>>>> So it's just a matter of waiting a new commit getting push'ed to se=
e if it will
>>>>> be working.
>>>>
>>>> Hi Leonardo,
>>>>
>>>> I noticed a minor glitch in the generated PDFs.
>>>> They don't have Git commit info in the title page and footer area of=

>>>> pages.
>>>>
>>>> I can't tell what went wrong, but expected autodate.tex should look =
like:
>>>
>>> I found it out: gitlab was doing a shallow clone, and the previous ta=
g was not
>>> in the commits, so I modified the Gitlab config so it does a complete=
 clone of
>>> the repository instead.
>>
>> Aha!  The script has never tested under a shallow clone...
>> Let me see if I can improve its behavior.
>>
>>> The last output of the pipeline seems to have been correct, please ch=
eck:
>>> https://gitlab.com/linux-kernel/perfbook/-/jobs/3705185694/artifacts/=
browse
>>
>> Apparently, the commit id does not make sense in Paul's repo.
>> But the random YML file approach should resolve it.
>=20
> Apologies, I left it untracked.  There is now a Leonardo.2023.02.01a
> branch that references it.

I mean the commit id 81974e57 presented in the artifacts is of the commit=

Leonardo made on his own:

    https://gitlab.com/linux-kernel/perfbook/-/commit/81974e57bed4

        Thanks, Akira

>=20
> 							Thanx, Paul

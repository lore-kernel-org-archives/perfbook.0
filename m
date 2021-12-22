Return-Path: <SRS0=2gMv=RH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cKIWIR+uGZ3EUlsF2JNqIK1yOqw+eyWAlXQyZWWC4dM=;
        b=Eam5wnLpU2eLpS0N8avaVFCMBjbgalnrNAZc9Y1JYiOlgN4bSdBKoGubHcftLprnNY
         eJC8hBtrY2LT0z6O/wWQhoDeEau3Je44sf35EUiIhzPDv2ZLp/1p6OwleXbzF6Jml8qE
         wUFznWbfRc0aGRXEkOEySSj8ImD4+K0Ger5XD3QeBeNgJ77P2NEWKmph2I3SiNDDTRDx
         Z2hu2XvJgw6ZXOJfYOXkSni+smRWFpHAKKSmyfQzwpb6hZTbYyGqaihp41cjH1mWlO+6
         3Nv6JwL3dzHLeWPiHCGmv9dfxsTJpuHNjPaElb3rW8hwZHCfjDKxR1KW8EvRyDqUihth
         Lasw==
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
References: <CAJbg=FWZG2EicBGKBbVzYnhH7oT3FqkwY738pmra9G9riGssVQ@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com>
Date: Wed, 22 Dec 2021 17:21:27 +0900
MIME-Version: 1.0
In-Reply-To: <CAJbg=FWZG2EicBGKBbVzYnhH7oT3FqkwY738pmra9G9riGssVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
List-ID: <perfbook.vger.kernel.org>

(+explicit Cc: Paul)

Hi Elad,

On Tue, 21 Dec 2021 10:20:52 -0500, Elad Lahav wrote:
> Hi Paul,
> 
> As promised, I have a potentially more interesting comment regarding
> Section 9.5. Throughout this section, from the very first example, the
> writer uses release semantics, but the readers are not obligated to
> use acquire semantics, at least on sensible architectures (with
> apologies to employees of HP nee Compaq nee Digital).

  ;-)

> 
> If I understand correctly, these relaxed semantics are the result of
> an address dependency, with the data protected by the RCU critical
> section residing in a structure whose address is stored by the pointer
> dereferenced by a reader. The reader cannot consider any data outside
> of this structure as protected by the critical section. This is a
> critical point without which the examples won't work reliably.

I think this is mostly covered in Section 9.5.2.1 "Publish-Subscribe
Mechanism" and Figure 9.10 "Publication/Subscription Constraints".

> 
> Am I missing something? If not, I think that this point should be
> emphasized early on, with a link to Section 15.2.3.

There is such a reference in Section 9.5.2.1 just below Quick Quiz
9.28.  You mean you find this too late?

        Thanks, Akira

BTW, I couldn't figure out what you meant by "the Spanish
Acquisition"...

> 
> --Elad
> 

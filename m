Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zaTNT1NZQIwAOaw9Xat0PBFtKU6qOgJqRsSSm4rjS4U=;
 b=VzC01HxdxPR+xvs6goWHPcYXxXsgO/TI/G/bnoFVnvuDQV5hfSDy1k4x5sm2WGV37C
 NK09WMNfhnqOSrPv4WpTHaMwhbubAn11ChRAnc9A8U9NfkkEhXTOf0iXzExl+kZr3vcv
 ArSBf6slY9qvtdtcengC9HTZ+hSHzp7QuB57N+73mlIEDsbSUU0KasalDV9B5tE3yLY9
 p6CvDiUs6WaT4DLgjwfqdmu3mqDKKLfTYOKrkBs5Pcy/eaOHO1fwB+kGkFcL43e9ja3M
 fuMi4IY8D68MkLxTIv+A2qrJ4N8WhOPmqphOQ7FM5Y8kjLJvpCgbBf8zmyUUDzKwbs1l
 E1Kg==
Subject: Re: [Q] Heisenbug and anti-heisenbug
References: <883b737a-0c32-dedc-daff-db556a6ec83a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <61b85306-48c8-d90d-b6a0-e56dbe1b75a3@gmail.com>
Date: Wed, 3 May 2017 09:23:11 +0900
MIME-Version: 1.0
In-Reply-To: <883b737a-0c32-dedc-daff-db556a6ec83a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/03 09:09:37 +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> While reviewing your recent update in "Hunting Heisenbugs" section,
> I found the analogy with particle physics didn't sit well with me.
> 
> "Heisenbug" is defined as:
> 
>> attempts to track down the heisenbug causes it to radically change
>> its symptoms or even disappear completely. 
> 
> "Anti-heisenbug" is introduced as:
> 
>> Fortunately, particle physics is up to the task: Why not create
>> an anti-heisenbug to annihilate the heisenbug?
> 
> At this point, "anti-heisenbug" seems to mean a patch that fixes
> the heisenbug.
> 
> The use of anti-something in particle physics does not go along
> with this usage.
> 
> For example, antiproton is an antiparticle of proton.
> antiproton has mostly the same property as proton,
> with the exception of electric charge and magnetic moment.
> Also, an antiproton and an antielectron (positron) can compose
> an antihydrogen atom. Well, I'm sure you know all about this.
> 
> So, if you employ this line of reasoning, an anti-heisenbug should
> also be a bug with something opposite in nature.
> 
> If a heisenbug is a bug which vanishes when it is being tracked down,
> an anti-heisenbug would be a bug which only emerges when it (or 
> something else) is being tracked down.
> 
> However, it is not obvious you can create an anti-heisenbug for
> a particular heisenbug so that when the two are combined, the symptoms
> of both bugs to "annihilate".
> 
> So I'm wondering "What was Paul's intention in using the word 'annihilate'?".
> 
> In Section "Add Delay", anti-heisenbug is used as:
> 
>> Once you spot a bug involving a race condition, it is frequently
>> possible to create an anti-heisenbug by adding delay in this manner.
> 
> This "anti-heisenbug" is not a bug, rather, it is a means to increase
> the possibility of a given heisenbug to appear. 
> 

Oops, I sent this prematurely.
But you might be able to see my point here.

This is not an important question, so please give it a look when you have
done with whatever issue you are working on.

                              Thanks, Akira


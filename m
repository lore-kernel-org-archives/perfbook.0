Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=lQmnPQgtVeO9f/kLnC2bmRZPE8hL3ToS2CLhVMOrnsI=;
 b=RUJ9D7BE43g0+4aWgJ8kvLRkYZVx9GnmSA00rtufZyYS6jfgIfRBCj88WvVoEG7yQs
 MpgGDvu0R2uYL+YuZCAY35Qj19pg7CbL2Ngl8LPhMKM1iZ9vMCgm+3IY1ranC0JOUU7A
 nPq3pR7RaFnYEPGPGuDernaGbnDCTehkE7aKMckYNc7ohzK7CCrQwztWIBfvyX5zvISk
 u9jZLcuqN9x8xbXDkf5nGno/pxGb75HFn+FfkxxmTv87yVxxwv9dgOA3tSdnqMUZa9yU
 gbPT/lKb913+YLDg4e8mp/QBAYc7LASWDol+Epl7JAjoD1d4yJhgq6bW1Etlvm9suZTt
 Xd3Q==
Subject: Re: [PATCH] whymb: Remove redundant words
References: <f053f42a-478a-8c35-780a-a51094b03030@gmail.com>
 <20160428140731.GE4609@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ed2f9c6a-eb0e-bd1e-d104-7425900bbf73@gmail.com>
Date: Fri, 29 Apr 2016 00:46:45 +0900
MIME-Version: 1.0
In-Reply-To: <20160428140731.GE4609@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/28 23:07, Paul E. McKenney wrote:
> On Thu, Apr 28, 2016 at 08:18:15PM +0900, Akira Yokosawa wrote:
>> >From 53364b467603cd5ec9e1f6a12ad9377a76ebb72a Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiysw@gmail.com>
>> Date: Thu, 28 Apr 2016 20:08:32 +0900
>> Subject: [PATCH] whymb: Remove redundant words
>>
>> The sentence fixed in commit 3d3ce3673746 ("Fix now-obsolete back
>> reference to Compaq Wizard web page") has redundant words around
>> the citation. This commit removes them.
>>
>> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> 
> Good catch, queued!
> 
> And no, that change wasn't one of my better efforts, was it?
> 
> 							Thanx, Paul

Perhaps, you shouldn't apply your own patch on your own.
But, who else can manage the perfbook repository.

Or, in cases such as this one, you could ask an ack from the person
in reported-by. Just a suggestion.

                                              Thanks, Akira.


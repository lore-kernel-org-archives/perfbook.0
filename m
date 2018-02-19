Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zbL/fSsW7OU/N8qSE0E2FngdXUaPuyrR0BZ55/3plk4=;
 b=qA8REWd4ReD7ZZuOVk8tSjbayNgeIQN2YrvoHyINNv/H8s7xbBWMTS6LngV0bB2Bcn
 Z6xtYfQ9/3XPviRhQwG3pgDV+uKBPwmmmwn+iHAfvThs+DuVyZn/RwMLq8S44jE5sF35
 NXwvYGZuP+ogt59dOYbu6E6VphJBcbE7OAXCNcXJvv32OSTAiwUlLdtRtWnU2jBIlOmb
 N82KinZavEI0OVQYFtXjEOa7wgLqcsuPVwiGvM0S21a/10UyuOMnZ3zrKZufyoIniH9N
 GS7l+N1cSHp4jYxS7qU10fKxzJnsrOf22SH8vfUK7RCFQyRgPg2dYJQq524+WcdH+9lB
 a+QQ==
Subject: Re: [PATCH] CodeSamples/formal/herd: Remove dependency to
 linux-kernel-hardware.cat
References: <f00d9adf-bbcd-79c1-1454-6c217cb9ec1b@gmail.com>
 <20180219175353.GX3617@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2f80327a-ee5e-b7c6-5248-291400a0bcb9@gmail.com>
Date: Tue, 20 Feb 2018 07:54:59 +0900
MIME-Version: 1.0
In-Reply-To: <20180219175353.GX3617@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/02/20 2:53, Paul E. McKenney wrote:
> On Tue, Feb 20, 2018 at 12:14:24AM +0900, Akira Yokosawa wrote:
>> >From 9ef0701c8f161c8582bd6084e5d2706a0ad92d00 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 20 Feb 2018 00:09:53 +0900
>> Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to linux-kernel-hardware.cat
>>
>> linux-kernel-hardware.cat is not present in the branch expected
>> to be merged in 4.17 window.
> 
> Good point, but it might be added at some later date.

Let me rephrase the change log. How about the following reasoning.

The target "run-herd7" doesn't depend on linux-kernel-hardware.cat.
So remove it from the dependency list.
This change also makes the target compatible with memory-consistency-model
branch[1] intended to be in Linux 4.17 window at the moment.

NOTE: They say https://github.com/aparri/memory-model.git won't be
updated any more.

NOTE: We can add a target to run litmus tests with linux-kernel-hardware.cat
once it is added in mainline or a prospective branch.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git lkmm

>                                                       This does raise
> the question of whether it makes any sense to try to keep up with the
> Linux-kernel memory model once that model is in mainline.  ;-)

You mean litmus tests used in perfbook and their explanation?

      Thanks, Akira

> 
> 							Thanx, Paul
> 
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  CodeSamples/formal/herd/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
>> index 8e0635a..3162659 100644
>> --- a/CodeSamples/formal/herd/Makefile
>> +++ b/CodeSamples/formal/herd/Makefile
>> @@ -31,7 +31,7 @@
>>
>>  LKMM_DIR     := memory-model
>>  LKMM_FILES   := linux-kernel.bell linux-kernel.cat linux-kernel.cfg \
>> -		linux-kernel.def linux-kernel-hardware.cat lock.cat
>> +		linux-kernel.def lock.cat
>>  LKMM_LIST    := $(addprefix $(LKMM_DIR)/,$(LKMM_FILES))
>>  HERD_DIR     := $(shell pwd)
>>  HERD7_CMD    := $(shell which herd7)
>> -- 
>> 2.7.4
>>
> 


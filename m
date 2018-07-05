Return-Path: <imrep.amz@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to;
 bh=q9udOxntG5QROOQUIu6YTsgwYTf4YvvW8BY7EHlmny0=;
 b=bk8/+f/OymcbPc8stRd3WdncBvWYfuA5ByIjTCA3jbJvmVPt4CQZXorPuXj5oRULF5
 D55CexT4IX0WhQN/F8KuR+YvbcjWq3bpcXsf2mD05SGGWqDVkVOg7M8DBDErJlURVc9h
 FwCVEWUZqaZxleV85EQTJvhlomLm+sVr7cwvtjFm956vEqFLnJVSY7W6bUqiEepE44x3
 aqpQnWnWdcqTFr+nvqsHbn1hx6N70aLdmGfI1WYIpDRz8epljA0U0lUAMBrNUvcZ8im9
 /j4y5kcpSwcPA2cxvPME5gBcOwsUDpw28sHonho6f7wgN4aIrx5cN5C3+sHfnCjYxiSf
 9ndg==
MIME-Version: 1.0
From: Imre Palik <imrep.amz@gmail.com>
Date: Thu, 5 Jul 2018 22:09:49 +0200
Message-ID: 
 <CAFMy-Rm--uJjqAfFxdbJfuNd-XVsDm+Fh_jx1kGNaojgTgEWKg@mail.gmail.com>
Subject: counting examples
Content-Type: text/plain; charset="UTF-8"
To: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi All,

first of all, thanks for the great book.

I have some doubts about some of the counting examples.  Namely, those
that implement inc_count() as a simple increment operation.  If there
is nothing to restrain the compiler/linker, they can possibly merge
several increments together, or optionally keep the counter value in a
register.

Of course, this won't happen with counttorture, because of the
barrier() in the loop.  But I wonder if that barrier() should be part
of inc_count() instead.  What do you think?

Thanks,

Imre


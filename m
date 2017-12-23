Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:40183 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757161AbdLWDqW (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 22 Dec 2017 22:46:22 -0500
Received: by mail-pl0-f65.google.com with SMTP id 62so12485826pld.7
        for <perfbook@vger.kernel.org>; Fri, 22 Dec 2017 19:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kCG0HRk0ILPuMudtXOIFckJ2lki7OjCD01y49kUKTYk=;
        b=C8e3mHsl8f/OMy8rwbnpKpRk4P9kIi8SWcEd0gHWIYJ4pqPDF0+XO7zxZAOLidDcdG
         kRvLD+EG3gqcKSJ/I5Jb3EZck0hJX9adk1mpzxmDbVfb77GXOSha9Hwx0lk2GVMxk2Ym
         JUvjQ7957TxGca9PF+TC7hGnHsiImuqZJTNbS1dafyxYKk0jOcvLwngaeVWhjprq06vF
         RBpvvIxQWM39dcWKnePL8fjeZZ7Ow0/dvWFy3Wss9li5OHIVx8OTELdj/DDDyPQgipSg
         ENE7D4xJCjHYa5I+gCoJlWUWG3qXfmtXHV6h2YcOaz7U34TUcOY46n7Y64XctHsXvBTI
         H8qg==
Subject: [PATCH 4/4] toolsoftrade: Add quick quiz on ACCESS_ONCE()
References: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <149eefb1-12bb-d1a2-b14b-500055e411a2@gmail.com>
Date: Sat, 23 Dec 2017 12:46:19 +0900
MIME-Version: 1.0
In-Reply-To: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>


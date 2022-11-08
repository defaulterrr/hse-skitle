from typing import List
from dataclasses import dataclass

@dataclass
class Concord:
    line: str
    index: int

@dataclass
class IndexedConcord:
    line: str
    keyword: str
    index: int

@dataclass
class ReadyConcord:
    keyword: str
    index: int
    before_phrase: str
    after_phrase: str

    def to_string(self) -> str:
        return f"{self.keyword} {self.before_phrase}/{self.after_phrase} {self.index}".strip()
    
    def to_string_centered(self) -> str:
        return f"{self.before_phrase} {self.keyword} {self.after_phrase} {self.index}".strip()


def read_concords(input: List[str]):
    out: List[Concord] = []

    for (line, index) in zip(input, range(len(input))):
        out.append(
            Concord(line, index+1)
        )

    return out
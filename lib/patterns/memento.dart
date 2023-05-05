class Order {
  int _code = 0;
  int _amount = 0;
  int _total = 0;
  int _isCash = 0;
  int _isTakeAway = 0;

  void setCode(int code) {
    _code = code;
  }

  void setAmount(int amount) {
    _amount = amount;
  }

  void setTotal(int total) {
    _total = total;
  }

  void setIsCash(int isCash) {
    _isCash = isCash;
  }

  void setIsTakeAway(int isTakeAway) {
    _isTakeAway = isTakeAway;
  }

  int getCode() {
    return _code!;
  }

  int getAmount() {
    return _amount!;
  }

  int getTotal() {
    return _total!;
  }

  int getIsCash() {
    return _isCash!;
  }

  int getIsTakeAway() {
    return _isTakeAway!;
  }

  Memento createMemento() {
    return Memento(
      code: _code,
      amount: _amount,
      total: _total,
      isCash: _isCash,
      isTakeAway: _isTakeAway,
    );
  }

  void restoreMemento(Memento memento) {
    _code = memento.getCode();
    _amount = memento.getAmount();
    _total = memento.getTotal();
    _isCash = memento.getIsCash();
    _isTakeAway = memento.getIsTakeAway();
  }
}

class Memento {
  int? code;
  int? amount;
  int? total;
  int? isCash;
  int? isTakeAway;

  Memento({
    required this.code,
    required this.amount,
    required this.total,
    required this.isCash,
    required this.isTakeAway,
  });

  int getCode() {
    return code!;
  }

  int getAmount() {
    return amount!;
  }

  int getTotal() {
    return total!;
  }

  int getIsCash() {
    return isCash!;
  }

  int getIsTakeAway() {
    return isTakeAway!;
  }
}

class CareTaker {
  late Memento _memento;
  void saveState(Order order){
    _memento = order.createMemento();
  }
  void restoreState(Order order){
    order.restoreMemento(_memento);
  }
}